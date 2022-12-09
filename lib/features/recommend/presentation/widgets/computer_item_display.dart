import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:flutter/material.dart';

class ComputerItemDisplay extends StatelessWidget {
  final ComputerItem computerItem;
  const ComputerItemDisplay({required this.computerItem, super.key});

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
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(computerItem.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(computerItem.manufacturer,
                      style: Theme.of(context).textTheme.headline5),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(computerItem.name,
                      style: Theme.of(context).textTheme.headline4),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(computerItem.price.toString(),
                      style: Theme.of(context).textTheme.headline5),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(computerItem.score.toString(),
                      style: Theme.of(context).textTheme.headline6),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(computerItem.hits.toString(),
                      style: Theme.of(context).textTheme.headline6),
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

class ComputerItemErrorDisplay extends StatelessWidget {
  final String message;
  const ComputerItemErrorDisplay(
      {this.message = '해당 부품을 찾을 수 없습니다.', super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(message),
    );
  }
}

class ComputerItemLoadingDisplay extends StatelessWidget {
  const ComputerItemLoadingDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
