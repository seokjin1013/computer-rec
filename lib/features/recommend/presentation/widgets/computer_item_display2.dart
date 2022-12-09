import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ComputerItemDisplay2 extends StatelessWidget {
  final ComputerItem computerItem;
  const ComputerItemDisplay2({required this.computerItem, super.key});

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
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '${_getCommaSeperatedPrice(computerItem.price.toString())}원',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '⭐ ${computerItem.reviewScore.toStringAsPrecision(2)} / 5.0',
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('🔍 ${computerItem.numHit}',
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

  String _getCommaSeperatedPrice(String value) {
    String s = '';
    for (int i = 0; i < value.length; ++i) {
      if ((value.length - i) % 3 == 0 && i != 0) {
        s += ',';
      }
      s += value[i];
    }
    return s;
  }
}

// class ComputerItemErrorDisplay extends StatelessWidget {
//   final String message;
//   const ComputerItemErrorDisplay(
//       {this.message = '해당 부품을 찾을 수 없습니다.', super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {},
//       child: Text(message),
//     );
//   }
// }

// class ComputerItemLoadingDisplay extends StatelessWidget {
//   const ComputerItemLoadingDisplay({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CircularProgressIndicator();
//   }
// }
