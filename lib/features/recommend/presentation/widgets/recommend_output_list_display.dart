import 'package:clean_architecture_flutter/core/utility/shimmer.dart';

import '../provider/recommend_output_provider.dart';
import 'selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/string.dart';
import '../../domain/entities/recommend_output.dart';
import '../../domain/entities/computer_item.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utility/dartz_x.dart';

import '../pages/main_page.dart';

class RecommendOutputListDisplay extends StatelessWidget {
  const RecommendOutputListDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2E3945),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 500,
        child: buildListView(context),
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    return FutureBuilder(
      future: vmRead.results,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold(
            (l) => Container(),
            (r) => ListView(
              children: [
                for (int i = 0; i < r.length; ++i)
                  buildRecommendOutputListTile(context, i),
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildRecommendOutputListTile(BuildContext context, int index) {
    final vmRead = context.read<RecommendOutputProvider>();
    final vmWatch = context.watch<RecommendOutputProvider>();
    final titleList = ['Best', '2nd', '3rd', '4th', '5th'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 180,
        child: Card(
          color: vmWatch.viewIndex == index
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
                        child: buildImage(context, index),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(titleList[index],
                              style: Theme.of(context).textTheme.headline5),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: buildTotalPrice(context, index),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: buildBottleneck(context, index),
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

  Widget buildImage(BuildContext context, int index) {
    final vmRead = context.read<RecommendOutputProvider>();
    return FutureBuilder(
      future: vmRead.ccase[index],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold(
            (l) => Container(),
            (r) => Image.network(r.image),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildTotalPrice(BuildContext context, int index) {
    final vmRead = context.read<RecommendOutputProvider>();
    return FutureBuilder(
      future: vmRead.results,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold(
            (l) => Container(),
            (r) => Text(
                '${getCommaSeperatedPrice(r[index].totalPrice.toString())}원',
                style: Theme.of(context).textTheme.headline4),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildBottleneck(BuildContext context, int index) {
    final vmRead = context.read<RecommendOutputProvider>();
    return FutureBuilder(
      future: vmRead.bottleneck[index],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold(
              (l) => Container(),
              (r) => Text('호환성 ${100 - r}%',
                  style: Theme.of(context).textTheme.headline5));
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class RecommendOutputListDisplayLoading extends StatelessWidget {
  const RecommendOutputListDisplayLoading({this.play = true, super.key});
  final bool play;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2E3945),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 500,
        child: buildListView(context),
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    return ListView(children: [
      for (int i = 0; i < 5; ++i) buildRecommendOutputListTile(context, i),
    ]);
  }

  Widget buildRecommendOutputListTile(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 180,
        child: ShimmerLoading(
          play: play,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
