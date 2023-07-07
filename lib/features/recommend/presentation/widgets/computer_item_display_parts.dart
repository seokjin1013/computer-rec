import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/external_link_dialog.dart';

import '../../../../core/utility/future_widget.dart';
import '../../../../core/utility/hero_dialog_route.dart';
import '../../../../core/utility/shimmer.dart';
import '../../domain/entities/computer_item.dart';
import '../../domain/entities/no_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utility/string.dart';

import 'package:provider/provider.dart';

class ComputerItemDisplayPartsBuilder extends StatelessWidget {
  const ComputerItemDisplayPartsBuilder(this.data, {super.key});
  final Future<ComputerItem> data;

  @override
  Widget build(BuildContext context) {
    return FutureWidget(
      data: data,
      display: ((p0) => ComputerItemDisplayParts(p0)),
      error: const ComputerItemDisplayPartsLoading(play: false),
      loading: const ComputerItemDisplayPartsLoading(),
    );
  }
}

class ComputerItemDisplayParts extends StatelessWidget {
  final ComputerItem computerItem;
  const ComputerItemDisplayParts(this.computerItem, {super.key});

  @override
  Widget build(BuildContext context) {
    if (computerItem is NoComputerItem) {
      return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 100,
              child: Center(child: Text("${computerItem.partName} 부품이 없습니다.")),
            ),
          ],
        ),
      );
    }
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(computerItem.partName,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.bodyLarge),
                      Image.asset(width: 70, height: 70, 'checkmark.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'image$hashCode',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        computerItem.image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(computerItem.name,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.headline6),
                    Text(
                        '${getCommaSeperatedPrice(computerItem.cheapPrice.toString())}원',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('⭐ ${computerItem.score.toStringAsPrecision(2)} / 5.0',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('🔍 ${computerItem.hits}',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => Navigator.push(
                  context,
                  HeroDialogRoute(
                    builder: (BuildContext context) {
                      return Center(
                        child: buildDetailsDialog(context),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailsDialog(BuildContext context) {
    return AlertDialog(
      title:
          Text(computerItem.name, style: Theme.of(context).textTheme.headline4),
      content: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'image$hashCode',
              child: SizedBox.square(
                dimension: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    computerItem.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              '${getCommaSeperatedPrice(computerItem.cheapPrice.toString())}원',
                              style: Theme.of(context).textTheme.headline4),
                          const SizedBox(width: 24),
                          Text(
                              '가성비 ${computerItem.partName} ${computerItem.rank}위',
                              style: Theme.of(context).textTheme.headline6),
                          const SizedBox(width: 24),
                          Text(
                              '⭐ ${computerItem.score.toStringAsPrecision(2)} / 5.0',
                              style: Theme.of(context).textTheme.headline6),
                          const SizedBox(width: 24),
                          Text('🔍 ${computerItem.hits}',
                              style: Theme.of(context).textTheme.headline6),
                        ],
                      ),
                      const Divider(),
                      Text('세부사항',
                          style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: buildDetailsTable(context),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: ((context) => ExternalLinkDialog(
                                  link: computerItem.cheapLink)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('개별 구매',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        computerItem.shopLogo,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailsTable(BuildContext context) {
    final detailsMap = computerItem.detailsMap.entries.toList();
    return DataTable(
      headingRowHeight: 0,
      horizontalMargin: 0,
      columnSpacing: 0,
      checkboxHorizontalMargin: 0,
      dataRowHeight: 36,
      border: TableBorder.symmetric(
        inside: BorderSide(
            width: 1, color: Theme.of(context).textTheme.bodyText1!.color!),
        outside: BorderSide(
            width: 1.5, color: Theme.of(context).textTheme.bodyText1!.color!),
      ),
      columns: const [
        DataColumn(label: SizedBox.shrink()),
        DataColumn(label: SizedBox.shrink()),
        DataColumn(label: SizedBox.shrink()),
        DataColumn(label: SizedBox.shrink())
      ],
      rows: [
        for (int i = 0; i < (detailsMap.length + 1) ~/ 2; ++i)
          DataRow(
            cells: [
              DataCell(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    detailsMap[i * 2].key,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              DataCell(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    detailsMap[i * 2].value,
                  ),
                ),
              ),
              DataCell(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    (i * 2 + 1 < detailsMap.length)
                        ? detailsMap[i * 2 + 1].key
                        : '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              DataCell(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    (i * 2 + 1 < detailsMap.length)
                        ? detailsMap[i * 2 + 1].value
                        : '',
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class ComputerItemDisplayPartsLoading extends StatelessWidget {
  const ComputerItemDisplayPartsLoading({this.play = true, super.key});
  final bool play;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 100,
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ShimmerLoading(
                        play: play,
                        child: TextSpaceRoundRect(
                          child: Text('CPU',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                      ShimmerLoading(
                        play: play,
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShimmerLoading(
                    play: play,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const AspectRatio(
                        aspectRatio: 1,
                        child: ColoredBox(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerLoading(
                      play: play,
                      child: TextSpaceRoundRect(
                        child: Text('인텔 코어i5-12세대 12400F (엘더레이크) (정품)',
                            overflow: TextOverflow.fade,
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ),
                    ShimmerLoading(
                      play: play,
                      child: TextSpaceRoundRect(
                        child: Text('50000원',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ),
                    ShimmerLoading(
                      play: play,
                      child: TextSpaceRoundRect(
                        child: Text('⭐ 5.0 / 5.0',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ),
                    ShimmerLoading(
                      play: play,
                      child: TextSpaceRoundRect(
                        child: Text('🔍 123',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
