import '../../domain/entities/milestone.dart';
import 'recommend_output_page.dart';
import '../provider/main_provider.dart';
import '../widgets/computer_item_display.dart';
import '../widgets/computer_item_display2.dart';
import '../widgets/milestone_display.dart';
import '../widgets/selection_card.dart';
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
          TextButton(
              onPressed: () {},
              child:
                  Text('견적 추천', style: Theme.of(context).textTheme.headline6)),
          TextButton(
              onPressed: () {},
              child:
                  Text('이전 기록', style: Theme.of(context).textTheme.headline6)),
          TextButton(
              onPressed: () {},
              child:
                  Text('부품 목록', style: Theme.of(context).textTheme.headline6)),
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
                child: buildSelectionCard(
                  context,
                  () => context
                      .read<RecommendInputProvider>()
                      .togglePriorIntelCPU(),
                  context.select<RecommendInputProvider, bool>(
                      (value) => value.priorIntelCPU),
                  Image.asset('logo_intel.png'),
                  Text('인텔', style: Theme.of(context).textTheme.headline5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildSelectionCard(
                  context,
                  () => context
                      .read<RecommendInputProvider>()
                      .togglePriorAMDCPU(),
                  context.select<RecommendInputProvider, bool>(
                      (value) => value.priorAMDCPU),
                  Image.asset('logo_amd.png'),
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
                child: buildSelectionCard(
                  context,
                  () => context.read<RecommendInputProvider>().setPurpose(1),
                  context.select<RecommendInputProvider, bool>(
                      (value) => value.purpose == 1),
                  Image.asset('logo_intel.png'),
                  Text('사무용', style: Theme.of(context).textTheme.headline5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildSelectionCard(
                  context,
                  () => context.read<RecommendInputProvider>().setPurpose(2),
                  context.select<RecommendInputProvider, bool>(
                      (value) => value.purpose == 2),
                  Image.asset('logo_amd.png'),
                  Text('게임용', style: Theme.of(context).textTheme.headline5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildSelectionCard(
                  context,
                  () => context.read<RecommendInputProvider>().setPurpose(3),
                  context.select<RecommendInputProvider, bool>(
                      (value) => value.purpose == 3),
                  Image.asset('logo_amd.png'),
                  Text('그래픽용', style: Theme.of(context).textTheme.headline5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPriceSelection(BuildContext context) {
    List<int> priceRange = [50, 70, 90, 110, 130, 150, 200, 250, 10000];
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
                for (int i = 0; i < priceRange.length - 1; ++i)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildSelectionCard(
                      context,
                      () => context.read<RecommendInputProvider>().setPrice(
                          priceRange[i] * 10000, priceRange[i + 1] * 10000),
                      context.select<RecommendInputProvider, bool>((value) =>
                          value.priceLow / 10000 == priceRange[i] &&
                          value.priceHigh / 10000 == priceRange[i + 1]),
                      null,
                      Text(
                          i < priceRange.length - 2
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

  Widget buildSelectionCard(BuildContext context, VoidCallback onTap, bool isOn,
      Widget? image, Widget? text) {
    return Card(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (image != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: image,
                    ),
                  ),
                if (text != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: text,
                  ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: onTap,
              ),
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
