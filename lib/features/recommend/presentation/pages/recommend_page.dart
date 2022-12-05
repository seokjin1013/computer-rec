import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:convert/convert.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage(
      {this.title = "",
      this.cost = false,
      this.manufacturer = false,
      this.program = false,
      super.key});
  final String title;
  final bool cost;
  final bool manufacturer;
  final bool program;

  @override
  Widget build(BuildContext context) {
    Widget costWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '금액 입력',
          style: Theme.of(context).textTheme.headline5,
        ),
        RangeSlider(
          values: RangeValues(3, 5),
          onChanged: (value) {},
          min: 100000,
          max: 1000000,
          divisions: 18,
          labels: RangeLabels('3', '5'),
        ),
        Text('가격대: ${3} - ${5}'),
      ],
    );
    Widget priorManufacturerWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '제조사 선택',
          style: Theme.of(context).textTheme.headline5,
        ),
        // OptionCardTable(context.read<GlobalViewmodel>().manufacturerOptions),
      ],
    );
    Widget programToUseWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '사용할 프로그램 선택',
          style: Theme.of(context).textTheme.headline5,
        ),
        // OptionCardTable(context.read<GlobalViewmodel>().programOptions),
      ],
    );

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(width: 400),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline3,
              ),
              Expanded(
                child: ListView(
                  children: [
                    if (cost) costWidget,
                    if (manufacturer) priorManufacturerWidget,
                    if (program) programToUseWidget,
                  ],
                ),
              ),
              // const ResultButton(),
            ],
          ),
        ),
      ),
    );
  }
}
