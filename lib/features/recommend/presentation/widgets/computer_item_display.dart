import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ComputerItemDisplay extends StatelessWidget {
  final ComputerItem computerItem;
  const ComputerItemDisplay({required this.computerItem, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {}, child: Image.network(computerItem.image));
  }
}
