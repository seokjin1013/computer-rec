import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_combine.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/entities/program_fit.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_program_fit.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../domain/entities/recommend_input_list.dart';
import '../provider/recommend_output_provider.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: buildBottleneck(context)),
                Expanded(flex: 2, child: buildProgramFit(context)),
              ],
            ),
          ),
          Expanded(flex: 2, child: buildParts(context)),
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
            Text('CPU-GPU 호환성', style: Theme.of(context).textTheme.headline4),
            Expanded(child: buildBottleneckChart(context)),
          ],
        ),
      ),
    );
  }

  Widget buildBottleneckChart(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    final vmWatch = context.watch<RecommendOutputProvider>();
    return FutureBuilder(
      future: vmRead.bottleneck[vmWatch.viewIndex],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold(
            (l) => Container(),
            (r) => BottleneckChart(100 - r),
          );
        }
        return Container();
      },
    );
  }

  Widget buildProgramFit(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Text('적합도', style: Theme.of(context).textTheme.headline4),
            buildProgramFitList(context),
          ],
        ),
      ),
    );
  }

  Widget buildProgramFitList(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    final vmWatch = context.watch<RecommendOutputProvider>();
    return FutureBuilder(
      future: vmRead.programFit[vmWatch.viewIndex],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold(
            (l) => Container(),
            (r) => Expanded(
              child: ListView.separated(
                itemCount: r.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(r[index].name),
                  subtitle: ProgramFitChart(r[index]),
                ),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildParts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Text('견적서', style: Theme.of(context).textTheme.headline4),
            buildPartsList(context),
          ],
        ),
      ),
    );
  }

  Widget buildPartsList(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    final vmWatch = context.watch<RecommendOutputProvider>();
    final itemList = [
      vmRead.cpu[vmWatch.viewIndex],
      vmRead.vga[vmWatch.viewIndex],
      vmRead.ram[vmWatch.viewIndex],
      vmRead.mainboard[vmWatch.viewIndex],
      vmRead.ssd[vmWatch.viewIndex],
      vmRead.hdd[vmWatch.viewIndex],
      vmRead.cooler[vmWatch.viewIndex],
      vmRead.power[vmWatch.viewIndex],
      vmRead.ccase[vmWatch.viewIndex],
    ];
    final itemNum = [
      recommendOutput.numCpu,
      recommendOutput.numVga,
      recommendOutput.numRam,
      recommendOutput.numMainboard,
      recommendOutput.numSsd,
      recommendOutput.numHdd,
      recommendOutput.numCooler,
      recommendOutput.numPower,
      recommendOutput.numCase,
    ];
    final categories = [
      'CPU',
      'GPU',
      'RAM',
      'Mainboard',
      'SSD',
      'HDD',
      'Cooler',
      'Power',
      'Case',
    ];
    return Expanded(
      child: ListView(children: [
        for (int i = 0; i < itemList.length; ++i)
          FutureBuilder(
            future: itemList[i],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data!.fold(
                  (l) => Container(),
                  (r) => ComputerItemDisplay3(r, categories[i], itemNum[i]),
                );
              }
              return CircularProgressIndicator();
            },
          ),
      ]),
    );
  }
}

class BottleneckChart extends StatelessWidget {
  final double value;
  const BottleneckChart(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          pointers: <GaugePointer>[RangePointer(value: value)],
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
                ('${(value).toStringAsFixed(1)}%'),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

class ProgramFitChart extends StatelessWidget {
  final ProgramFit programFit;
  const ProgramFitChart(this.programFit, {super.key});

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      ranges: [
        LinearGaugeRange(
          startValue: 0,
          endValue: programFit.rate,
          shaderCallback: (bounds) => const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.greenAccent, Colors.blueAccent])
              .createShader(bounds),
        ),
      ],
      markerPointers: [
        LinearShapePointer(
          value: programFit.rate,
        ),
      ],
      maximum: 200,
      animateAxis: true,
      animateRange: true,
      animationDuration: 2000,
      labelFormatterCallback: (value) {
        if (value == '0') {
          return '부족';
        }
        if (value == '200') {
          return '충분';
        }
        return value;
      },
    );
  }
}
