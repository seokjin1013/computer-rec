import 'package:clean_architecture_flutter/features/recommend/domain/entities/milestone.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/provider/main_provider.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display2.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/milestone_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../injection_container.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("컴퓨터 견적 추천 서비스"),
        actions: [
          TextButton(onPressed: () {}, child: Text('견적 추천')),
          TextButton(onPressed: () {}, child: Text('이전 기록')),
          TextButton(onPressed: () {}, child: Text('부품 목록')),
        ],
      ),
      body: buildBody(context),
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
    return ListView(
      children: [
        buildMilestone(context),
        buildTodayTip(context),
        buildRecentHotCPUList(context),
      ],
    );
  }

  Widget buildMilestone(BuildContext context) {
    final vmRead = context.read<MainProvider>();
    final data = vmRead.getMileStone();
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold(
            (l) => MilestoneErrorDisplay(message: l.message),
            (r) => MilestoneDisplay(milestone: r),
          );
        }
        return const MilestoneLoadingDisplay();
      },
    );
  }

  Widget buildTodayTip(BuildContext context) {
    return Center(
      // heightFactor: 1,
      child: Text('💡오늘의 팁\n이러쿵저러쿵!',
          style: Theme.of(context).textTheme.headline4),
    );
  }

  Widget buildRecentHotCPUList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color(0xFF2E3945),
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
      ),
    );
  }

  Widget buildRecentHotCPU(BuildContext context, int rank) {
    final vmRead = context.read<MainProvider>();
    final data = vmRead.getComputerCPUBest(rank + 1);
    return SizedBox(
      width: 1200,
      child: FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!.fold(
              (l) => ComputerItemErrorDisplay(message: l.message),
              (r) => ComputerItemDisplay2(computerItem: r),
            );
          }
          return const ComputerItemLoadingDisplay();
        },
      ),
    );
  }
}
