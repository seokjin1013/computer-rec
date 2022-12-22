import 'package:clean_architecture_flutter/features/recommend/presentation/pages/recommend_input_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utility/future_widget.dart';
import '../../../../core/utility/shimmer.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/recommend_input.dart';
import '../provider/recommend_output_provider.dart';
import '../widgets/recommend_output_display.dart';
import '../widgets/recommend_output_list_display.dart';
import 'computer_item_list_page.dart';

class RecommendOutputPage extends StatelessWidget {
  final RecommendInput recommendInput;
  const RecommendOutputPage({required this.recommendInput, super.key});

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
      create: (context) => sl<RecommendOutputProvider>(),
      builder: (context, child) {
        return buildContent(context);
      },
    );
  }

  Widget buildContent(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    vmRead.setRecommendOutputList(recommendInput);
    return FutureWidget(
      data: vmRead.results,
      display: (p0) {
        if (p0.isEmpty) {
          return const Center(child: Text('조건을 만족하는 견적서가 없습니다.'));
        }
        return Row(
          children: const [
            RecommendOutputListDisplay(),
            Expanded(
              child: RecommendOutputDisplay(),
            ),
          ],
        );
      },
      error: Container(),
      loading: const Center(child: CircularProgressIndicator()),
    );
  }
}
