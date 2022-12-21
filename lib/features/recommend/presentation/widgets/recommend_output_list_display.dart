import 'package:clean_architecture_flutter/core/utility/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/string.dart';
import '../provider/recommend_output_provider.dart';

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
        if (snapshot.hasData) {
          return ListView(
            children: [
              for (int i = 0; i < snapshot.requireData.length; ++i)
                buildRecommendOutputListTile(context, i),
            ],
          );
        } else if (snapshot.hasError) {
          return Container();
        }
        return const CircularProgressIndicator();
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
        if (snapshot.hasData) {
          return Image.network(snapshot.requireData.image);
        } else if (snapshot.hasError) {
          return Container();
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget buildTotalPrice(BuildContext context, int index) {
    final vmRead = context.read<RecommendOutputProvider>();
    return FutureBuilder(
      future: vmRead.results,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
              '${getCommaSeperatedPrice(snapshot.requireData[index].totalPrice.toString())}원',
              style: Theme.of(context).textTheme.headline4);
        } else if (snapshot.hasError) {
          return Container();
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Widget buildBottleneck(BuildContext context, int index) {
    final vmRead = context.read<RecommendOutputProvider>();
    return FutureBuilder(
      future: vmRead.bottleneck[index],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('호환성 ${100 - snapshot.requireData}%',
              style: Theme.of(context).textTheme.headline5);
        } else if (snapshot.hasError) {
          return Container();
        }
        return const CircularProgressIndicator();
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
