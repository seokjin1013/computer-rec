import '../../domain/entities/recommend_input.dart';
import '../widgets/recommend_output_display.dart';
import '../widgets/recommend_output_list_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../injection_container.dart';
import '../provider/recommend_output_provider.dart';

class RecommendOutputPage extends StatelessWidget {
  final RecommendInput recommendInput;
  const RecommendOutputPage({required this.recommendInput, super.key});

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
      create: (context) => sl<RecommendOutputProvider>(),
      builder: (context, child) {
        return buildContent(context);
      },
    );
  }

  Widget buildContent(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    vmRead.setRecommendOutputList(recommendInput);
    return FutureBuilder(
      future: vmRead.results,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold((l) => Container(), (r) {
            if (r.length == 0) {
              return Center(child: Text('조건을 만족하는 견적서가 없습니다.'));
            }
            return Row(
              children: [
                RecommendOutputListDisplay(),
                Expanded(
                  child: RecommendOutputDisplay(r[vmRead.viewIndex]),
                ),
              ],
            );
          });
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
