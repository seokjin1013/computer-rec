import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/entities/no_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utility/string.dart';

class ComputerItemDisplay3 extends StatelessWidget {
  final ComputerItem computerItem;
  final String category;
  final int num;
  const ComputerItemDisplay3(this.computerItem, this.category, this.num,
      {super.key});

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
                      Text(category,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.bodyLarge),
                      Image.asset(width: 70, height: 70, 'checkmark.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      computerItem.image,
                      fit: BoxFit.fitHeight,
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
                        '${getCommaSeperatedPrice(computerItem.price.toString())}원',
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
                onTap: () {
                  debugPrint('Card tapped.');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
