import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/external_link_dialog.dart';

import '../../domain/entities/computer_item.dart';
import '../../domain/entities/no_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utility/string.dart';

class ComputerItemDisplay3 extends StatelessWidget {
  final ComputerItem computerItem;
  final int num;
  const ComputerItemDisplay3(this.computerItem, this.num, {super.key});

  @override
  Widget build(BuildContext context) {
    if (computerItem is NoComputerItem) {
      return Container();
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
                    tag: 'image${computerItem.partName}',
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
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('X$num',
                      style: Theme.of(context).textTheme.headline5),
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
                        child: buildDetailDialog(context),
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

  Widget buildDetailDialog(BuildContext context) {
    return AlertDialog(
      title:
          Text(computerItem.name, style: Theme.of(context).textTheme.headline4),
      content: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'image${computerItem.partName}',
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
                        child: buildDetailsTable2(context),
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
    return Table(
      border: TableBorder.symmetric(
        inside: BorderSide(
            width: 1, color: Theme.of(context).textTheme.bodyText1!.color!),
        outside: BorderSide(
            width: 1.5, color: Theme.of(context).textTheme.bodyText1!.color!),
      ),
      children: [
        for (int i = 0; i < (detailsMap.length + 1) ~/ 2; ++i)
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    detailsMap[i * 2].key,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    detailsMap[i * 2].value,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    (i * 2 + 1 < detailsMap.length)
                        ? detailsMap[i * 2 + 1].key
                        : '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
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

  Widget buildDetailsTable2(BuildContext context) {
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

class HeroDialogRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  HeroDialogRoute({required this.builder}) : super();

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  String? get barrierLabel => '';
}
