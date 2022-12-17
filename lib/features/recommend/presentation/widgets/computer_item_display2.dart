import '../../../../core/utility/shimmer.dart';
import '../../domain/entities/computer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/utility/string.dart';

class ComputerItemDisplay2 extends StatelessWidget {
  final ComputerItem computerItem;
  const ComputerItemDisplay2(this.computerItem, {super.key});

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
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(computerItem.name,
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '${getCommaSeperatedPrice(computerItem.cheapPrice.toString())}원',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '⭐ ${computerItem.score.toStringAsPrecision(2)} / 5.0',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('🔍 ${computerItem.hits}',
                          style: Theme.of(context).textTheme.headline6),
                    ),
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

class ComputerItemDisplay2Loading extends StatelessWidget {
  const ComputerItemDisplay2Loading({super.key});

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
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShimmerLoading(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const AspectRatio(
                        aspectRatio: 1,
                        child: ColoredBox(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShimmerLoading(
                        child: TextSpaceRoundRect(
                          text: Text(' ' * 50,
                              style: Theme.of(context).textTheme.headline4),
                        ),
                      ),
                    ),
                    for (int i = 0; i < 3; ++i)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShimmerLoading(
                          child: TextSpaceRoundRect(
                            text: Text(' ' * 30,
                                style: Theme.of(context).textTheme.headline5),
                          ),
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
