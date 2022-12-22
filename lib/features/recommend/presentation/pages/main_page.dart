import 'dart:math';

import 'package:clean_architecture_flutter/features/recommend/presentation/pages/computer_item_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/shimmer.dart';
import '../../../../injection_container.dart';
import '../provider/main_provider.dart';
import '../widgets/computer_item_display_hit.dart';
import '../widgets/milestone_display.dart';
import 'recommend_input_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("컴퓨터 견적 추천 서비스"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecommendInputPage(),
                  ),
                );
              },
              child:
                  Text('견적 추천', style: Theme.of(context).textTheme.headline6)),
          TextButton(
              onPressed: () {},
              child:
                  Text('이전 기록', style: Theme.of(context).textTheme.headline6)),
          TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ComputerItemListPage(),
                  ),
                );
              },
              child:
                  Text('부품 목록', style: Theme.of(context).textTheme.headline6)),
        ],
      ),
      body: Shimmer(child: buildBody(context)),
    );
  }

  Widget buildBody(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<MainProvider>(),
      builder: (context, child) {
        return buildContent(context);
      },
    );
  }

  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 1200,
          child: Column(
            children: [
              buildMilestone(context),
              buildTodayTip(context),
              buildRecentHotCPUList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMilestone(BuildContext context) {
    final vmRead = context.read<MainProvider>();
    return MilestoneDisplayBuilder(vmRead.getMileStone());
  }

  Widget buildTodayTip(BuildContext context) {
    final vmRead = context.read<MainProvider>();
    int randomNumber = Random().nextInt(16);
    randomNumber = 0;
    Future<String> tip = vmRead.getTodayTip(randomNumber);
    return FutureBuilder(
      future: tip,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Text('💡오늘의 팁\n${snapshot.data}',
                style: Theme.of(context).textTheme.headline4),
          );
        }
        return Center(
          child: Text('💡오늘의 팁', style: Theme.of(context).textTheme.headline4),
        );
      },
    );
  }

  Widget buildRecentHotCPUList(BuildContext context) {
    return Card(
      color: const Color(0xFF2E3945),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('최근 🔥한 CPU', style: TextStyle(fontSize: 40)),
          ),
          for (int i = 0; i < 3; ++i)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildRecentHotCPU(context, i),
            ),
        ],
      ),
    );
  }

  Widget buildRecentHotCPU(BuildContext context, int rank) {
    final vmRead = context.read<MainProvider>();
    return ComputerItemDisplayHitBuilder(vmRead.getComputerCPUHit(rank + 1));
  }
}
