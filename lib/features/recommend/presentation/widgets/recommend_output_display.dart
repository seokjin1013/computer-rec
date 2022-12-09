import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_combine.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../domain/entities/recommend_input_list.dart';

class RecommendOutputDisplay extends StatelessWidget {
  final RecommendOutput recommendOutput;
  const RecommendOutputDisplay(this.recommendOutput, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2E3945),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(child: buildBottleneck(context)),
                Expanded(child: buildProgramFit(context)),
              ],
            ),
          ),
          Expanded(child: buildPartsList(context)),
        ],
      ),
    );
  }

  Widget buildBottleneck(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Text('병목률', style: Theme.of(context).textTheme.headline4),
            BottleneckChart(0.4)
          ],
        ),
      ),
    );
  }

  Widget buildProgramFit(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(),
    );
  }

  Widget buildPartsList(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(),
        ),
      ),
    );
  }
}

class BottleneckChart extends StatelessWidget {
  final double value;
  const BottleneckChart(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 300, height: 200, child: _MyHomePage(value));
  }
}

class _MyHomePage extends StatefulWidget {
  final double value;
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage(this.value, {Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          pointers: <GaugePointer>[RangePointer(value: widget.value * 100)],
          startAngle: 180,
          canScaleToFit: true,
          endAngle: 0,
          interval: 10,
          useRangeColorForAxis: true,
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              axisValue: 50,
              positionFactor: 0.4,
              widget: Text(
                ((widget.value * 100).toStringAsFixed(1)),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ],
      animationDuration: 2000,
      enableLoadingAnimation: true,
    );
  }
}
