import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/recommend_list.dart';
import 'menu_card_widget.dart';

class RecommendListDisplay extends StatelessWidget {
  const RecommendListDisplay(this.recommendList, {super.key});
  final RecommendList recommendList;

  Widget _buildItem(
      BuildContext context, String name, ImageProvider image, String category) {
    return SizedBox(
      height: 200,
      child: MenuCard(
        image: image,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
            ),
          ],
        ),
      ),
    );
  }

  Table _buildTable(BuildContext context, List items, String category) {
    List contents = [
      for (List item in items)
        _buildItem(context, item[0], AssetImage(item[1]), category)
    ];
    if (items.length % 2 == 1) {
      contents.add(Container());
    }
    return Table(children: [
      for (int i = 0; i < items.length / 2; ++i)
        TableRow(children: [
          contents[i * 2],
          contents[i * 2 + 1],
        ])
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (MapEntry entry in recommendList.entries) {
      widgets.add(Text(entry.key.toString(),
          style: Theme.of(context).textTheme.headline6));
      widgets.add(_buildTable(context, entry.value, entry.key));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
