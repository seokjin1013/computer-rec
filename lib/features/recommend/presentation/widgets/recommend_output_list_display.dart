import 'package:clean_architecture_flutter/features/recommend/presentation/provider/recommend_output_provider.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/string.dart';
import '../../domain/entities/computer_combine.dart';
import '../../domain/entities/computer_item.dart';
import '../../../../core/error/failures.dart';
import 'package:clean_architecture_flutter/core/utility/dartz_x.dart';

import '../pages/main_page.dart';

class RecommendOutputListDisplay extends StatelessWidget {
  const RecommendOutputListDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    return Card(
      color: const Color(0xFF2E3945),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 500,
        child: ListView(
          children: [
            for (int i = 0; i < vmRead.results.asRight().length; ++i)
              buildRecommendOutputListTile(context, i),
          ],
        ),
      ),
    );
  }

  Widget buildRecommendOutputListTile(BuildContext context, int index) {
    final vmRead = context.read<RecommendOutputProvider>();
    final titleList = ['Best', '2nd', '3rd', '4th', '5th'];
    return FutureBuilder(
      future: Future.wait(
          [vmRead.ccaseReady[index], vmRead.bottleneckReady[index]]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final computerCase = snapshot.data![0];
          final title = titleList[index];
          final totalPrice = recommendOutput.totalPrice;
          final bottleneck = snapshot.data![1];
          if (computerCase.isLeft()) {
            return RecommendOutputListTileErrorDisplay(
                message: computerCase.asLeft().message);
          }
          if (bottleneck.isLeft()) {
            return RecommendOutputListTileErrorDisplay(
                message: bottleneck.asLeft().message);
          }
          return RecommendOutputListTileDisplay(
            representativeItem: computerCase.asRight() as ComputerItem,
            title: title,
            totalPrice: totalPrice,
            bottleneck: bottleneck.asRight() as double,
            index: index,
          );
        }
        return RecommendOutputListTileLoadingDisplay();
      },
    );
  }
}

class RecommendOutputListLoadingDisplay extends StatelessWidget {
  const RecommendOutputListLoadingDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

class RecommendOutputListErrorDisplay extends StatelessWidget {
  final String message;
  const RecommendOutputListErrorDisplay(
      {this.message = '정보를 불러올 수 없습니다.', super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(message),
    );
  }
}

class RecommendOutputListTileDisplay extends StatelessWidget {
  final ComputerItem representativeItem;
  final String title;
  final int totalPrice;
  final double bottleneck;
  final int index;
  const RecommendOutputListTileDisplay(
      {required this.representativeItem,
      required this.title,
      required this.totalPrice,
      required this.bottleneck,
      required this.index,
      super.key});

  @override
  Widget build(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    final vmWatch = context.watch<RecommendOutputProvider>();
    final isOn = vmWatch.viewIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 200,
        child: Card(
          color: isOn
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).cardColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(representativeItem.image),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(title,
                              style: Theme.of(context).textTheme.headline5),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              '${getCommaSeperatedPrice(totalPrice.toString())}원',
                              style: Theme.of(context).textTheme.headline4),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('병목률 $bottleneck%',
                              style: Theme.of(context).textTheme.headline5),
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
                      vmRead.viewIndex = index;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendOutputListTileLoadingDisplay extends StatelessWidget {
  const RecommendOutputListTileLoadingDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

class RecommendOutputListTileErrorDisplay extends StatelessWidget {
  final String message;
  const RecommendOutputListTileErrorDisplay(
      {this.message = '정보를 불러올 수 없습니다.', super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(message),
    );
  }
}
