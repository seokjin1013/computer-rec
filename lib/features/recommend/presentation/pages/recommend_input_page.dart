import 'package:clean_architecture_flutter/features/recommend/domain/entities/milestone.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/pages/recommend_output_page.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/provider/main_provider.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display2.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/milestone_display.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../injection_container.dart';
import '../provider/recommend_input_provider.dart';

class RecommendInputPage extends StatelessWidget {
  const RecommendInputPage({super.key});

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
      create: (context) => sl<RecommendInputProvider>(),
      builder: (context, child) {
        return buildContent(context);
      },
    );
  }

  Widget buildContent(BuildContext context) {
    return ListView(
      children: [
        buildCPUBrandSelection(context),
        buildPurposeSelection(context),
        buildPriceSelection(context),
        buildCompleteButton(context),
      ],
    );
  }

  Widget buildCPUBrandSelection(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('CPU 브랜드 선택',
                    style: Theme.of(context).textTheme.headline3),
                Text('선호하는 CPU 브랜드가 있다면 골라주세요.',
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectionCard(
                  onTap: () {},
                  image: Image.asset('logo_intel.png'),
                  text:
                      Text('인텔', style: Theme.of(context).textTheme.headline5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectionCard(
                  onTap: () {},
                  image: Image.asset('logo_amd.png'),
                  text:
                      Text('AMD', style: Theme.of(context).textTheme.headline5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPurposeSelection(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('사용 목적 선택', style: Theme.of(context).textTheme.headline3),
                Text('사용할 목적에 맞는 선택지 하나를 골라주세요.',
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectionCard(
                  onTap: () {},
                  image: Image.asset('logo_intel.png'),
                  text:
                      Text('사무용', style: Theme.of(context).textTheme.headline5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectionCard(
                  onTap: () {},
                  image: Image.asset('logo_amd.png'),
                  text:
                      Text('게임용', style: Theme.of(context).textTheme.headline5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectionCard(
                  onTap: () {},
                  image: Image.asset('logo_amd.png'),
                  text: Text('그래픽용',
                      style: Theme.of(context).textTheme.headline5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPriceSelection(BuildContext context) {
    List<int> priceRange = [50, 70, 90, 110, 130, 150, 200, 250];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('컴퓨터 가격', style: Theme.of(context).textTheme.headline3),
                Text('가격을 아래 선택지 중 하나로 골라주세요.',
                    style: Theme.of(context).textTheme.caption),
              ],
            ),
          ),
          SizedBox(
            width: 1200,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < priceRange.length; ++i)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectionCard(
                      onTap: () {},
                      text: Text(
                          i < priceRange.length - 1
                              ? '${priceRange[i]} - ${priceRange[i + 1]}만 원'
                              : '${priceRange[i]} 만 원 이상',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCompleteButton(BuildContext context) {
    final vmRead = context.read<RecommendInputProvider>();
    final recommendInput = vmRead.recommendInput;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecommendOutputPage(
                  recommendInput: recommendInput,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("➡견적 추천!",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
