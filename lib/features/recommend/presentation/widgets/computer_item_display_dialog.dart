import 'package:flutter/material.dart';

import '../../../../core/utility/string.dart';
import '../../domain/entities/computer_item.dart';
import 'external_link_dialog.dart';

class ComputerItemDisplayDialog extends StatelessWidget {
  const ComputerItemDisplayDialog(this.computerItem, {this.code, super.key});
  final ComputerItem computerItem;
  final int? code;

  @override
  Widget build(BuildContext context) {
    return buildDetailsDialog(context);
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
              tag: 'image${code ?? hashCode}',
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
