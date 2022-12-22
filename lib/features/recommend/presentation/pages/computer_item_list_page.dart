import 'package:clean_architecture_flutter/core/utility/future_widget.dart';
import 'package:clean_architecture_flutter/core/utility/string.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/hero_dialog_route.dart';
import '../../../../core/utility/shimmer.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/computer_item.dart';
import '../provider/computer_item_list_provider.dart';
import 'recommend_input_page.dart';

class ComputerItemListPage extends StatelessWidget {
  const ComputerItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("컴퓨터 견적 추천 서비스"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecommendInputPage(),
                    ),
                  );
                },
                child: Text('견적 추천',
                    style: Theme.of(context).textTheme.headline6)),
            TextButton(
                onPressed: () {},
                child: Text('이전 기록',
                    style: Theme.of(context).textTheme.headline6)),
            TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ComputerItemListPage(),
                    ),
                  );
                },
                child: Text('부품 목록',
                    style: Theme.of(context).textTheme.headline6)),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('CPU')),
              Tab(child: Text('GPU')),
              Tab(child: Text('RAM')),
              Tab(child: Text('MainBoard')),
              Tab(child: Text('SSD')),
              Tab(child: Text('HDD')),
              Tab(child: Text('Cooler')),
              Tab(child: Text('Power')),
              Tab(child: Text('Case')),
              Tab(child: Text('Monitor')),
              Tab(child: Text('Keyboard')),
              Tab(child: Text('Mouse')),
            ],
          ),
        ),
        body: Shimmer(child: buildBody(context)),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<ComputerItemListProvider>(),
      builder: (context, child) {
        final vmRead = context.read<ComputerItemListProvider>();
        final functions = [
          vmRead.getComputerCPUList,
          vmRead.getComputerVGAList,
          vmRead.getComputerRAMList,
          vmRead.getComputerMainBoardList,
          vmRead.getComputerSSDList,
          vmRead.getComputerHDDList,
          vmRead.getComputerCoolerList,
          vmRead.getComputerPowerList,
          vmRead.getComputerCaseList,
          vmRead.getComputerMonitorList,
          vmRead.getComputerKeyboardList,
          vmRead.getComputerMouseList,
        ];
        return TabBarView(
          children: [
            for (final f in functions)
              buildContent(
                  context,
                  f().then((value) async {
                    List<ComputerItem> result = [];
                    // if (value is List<Future<ComputerVGA>>) {

                    // }
                    for (Future<ComputerItem> e in value) {
                      result.add(await e);
                    }
                    return result;
                  })),
          ],
        );
      },
    );
  }

  Widget buildContent(BuildContext context, Future<List<ComputerItem>> data) {
    return Column(
      children: [
        Expanded(
          child: FutureWidget(
            data: data,
            display: (p0) => ComputerItemListDisplay(p0),
            error: Container(),
            loading: const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}

class ComputerItemListDisplay extends StatefulWidget {
  const ComputerItemListDisplay(this.data, {super.key});
  final List<ComputerItem> data;
  @override
  State<ComputerItemListDisplay> createState() =>
      _ComputerItemListDisplayState();
}

class _ComputerItemListDisplayState extends State<ComputerItemListDisplay> {
  bool currentSortAscending = false;
  int currentSortColumnIndex = 2;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: DataTable(
          sortAscending: currentSortAscending,
          sortColumnIndex: currentSortColumnIndex,
          showCheckboxColumn: false,
          columns: [
            const DataColumn(
              label: Text('이미지'),
            ),
            DataColumn(
              label: const Text('부품명'),
              onSort: (columnIndex, ascending) => setState(() {
                currentSortColumnIndex = columnIndex;
                if (currentSortAscending) {
                  widget.data.sort((a, b) => a.name.compareTo(b.name));
                } else {
                  widget.data.sort((a, b) => b.name.compareTo(a.name));
                }
                currentSortAscending = !currentSortAscending;
              }),
            ),
            DataColumn(
              label: const Text('가성비 순위'),
              numeric: true,
              onSort: (columnIndex, ascending) => setState(() {
                currentSortColumnIndex = columnIndex;
                if (currentSortAscending) {
                  widget.data.sort((a, b) => a.rank.compareTo(b.rank));
                } else {
                  widget.data.sort((a, b) => b.rank.compareTo(a.rank));
                }
                currentSortAscending = !currentSortAscending;
              }),
            ),
            DataColumn(
              label: const Text('가격'),
              numeric: true,
              onSort: (columnIndex, ascending) => setState(() {
                currentSortColumnIndex = columnIndex;
                if (currentSortAscending) {
                  widget.data
                      .sort((a, b) => a.cheapPrice.compareTo(b.cheapPrice));
                } else {
                  widget.data
                      .sort((a, b) => b.cheapPrice.compareTo(a.cheapPrice));
                }
                currentSortAscending = !currentSortAscending;
              }),
            ),
            DataColumn(
              label: const Text('평점'),
              numeric: true,
              onSort: (columnIndex, ascending) => setState(() {
                currentSortColumnIndex = columnIndex;
                if (currentSortAscending) {
                  widget.data.sort((a, b) => a.score.compareTo(b.score));
                } else {
                  widget.data.sort((a, b) => b.score.compareTo(a.score));
                }
                currentSortAscending = !currentSortAscending;
              }),
            ),
            DataColumn(
              label: const Text('조회수'),
              numeric: true,
              onSort: (columnIndex, ascending) => setState(() {
                currentSortColumnIndex = columnIndex;
                if (currentSortAscending) {
                  widget.data.sort((a, b) => a.hits.compareTo(b.hits));
                } else {
                  widget.data.sort((a, b) => b.hits.compareTo(a.hits));
                }
                currentSortAscending = !currentSortAscending;
              }),
            ),
            DataColumn(
              label: const Text('제조사'),
              numeric: true,
              onSort: (columnIndex, ascending) => setState(() {
                currentSortColumnIndex = columnIndex;
                if (currentSortAscending) {
                  widget.data
                      .sort((a, b) => a.manufacturer.compareTo(b.manufacturer));
                } else {
                  widget.data
                      .sort((a, b) => b.manufacturer.compareTo(a.manufacturer));
                }
                currentSortAscending = !currentSortAscending;
              }),
            ),
          ],
          rows: [
            for (ComputerItem e in widget.data)
              DataRow(
                cells: [
                  DataCell(Hero(
                      tag: 'image${e.rank}', child: Image.network(e.image))),
                  DataCell(Text(e.name)),
                  DataCell(Text(e.rank.toString())),
                  DataCell(
                      Text(getCommaSeperatedPrice(e.cheapPrice.toString()))),
                  DataCell(Text(e.score.toString())),
                  DataCell(Text(e.hits.toString())),
                  DataCell(Text(e.manufacturer.toString())),
                ],
                onSelectChanged: (value) {
                  if (value!) {
                    Navigator.push(
                      context,
                      HeroDialogRoute(
                        builder: (BuildContext context) {
                          return Center(
                            child: ComputerItemDisplayDialog(e, code: e.rank),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
