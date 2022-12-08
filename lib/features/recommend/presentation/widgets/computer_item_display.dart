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
