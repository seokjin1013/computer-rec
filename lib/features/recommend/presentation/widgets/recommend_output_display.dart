import 'package:clean_architecture_flutter/core/utility/future_widget.dart';
import 'package:clean_architecture_flutter/core/utility/shimmer.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display_parts.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/external_link_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../domain/entities/computer_item.dart';
import '../../domain/entities/program_fit.dart';
import '../provider/recommend_output_provider.dart';

class RecommendOutputDisplay extends StatelessWidget {
  const RecommendOutputDisplay({super.key});

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('CPU-GPU 호환성',
                  style: Theme.of(context).textTheme.headline4),
            ),
            Expanded(child: buildBottleneckChart(context)),
          ],
        ),
      ),
    );
  }

  Widget buildBottleneckChart(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    final vmWatch = context.watch<RecommendOutputProvider>();
    return FutureWidget(
      data: vmRead.bottleneck[vmWatch.viewIndex],
      display: ((p0) =>
          100 - p0 > 0 ? BottleneckChart(100 - p0) : const NoBottleneckChart()),
      error: Container(),
      loading: Container(),
    );
  }

  Widget buildProgramFit(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('적합도', style: Theme.of(context).textTheme.headline4),
            ),
            buildProgramFitList(context),
          ],
        ),
      ),
    );
  }

  Widget buildProgramFitList(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    final vmWatch = context.watch<RecommendOutputProvider>();
    return FutureWidget(
      data: vmRead.programFit[vmWatch.viewIndex],
      display: ((p0) => Expanded(
            child: ListView.separated(
              itemCount: p0.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(p0[index].name),
                subtitle: ProgramFitChart(p0[index]),
              ),
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          )),
      error: Container(),
      loading: Container(),
    );
  }

  Widget buildParts(BuildContext context) {
    final vmRead = context.read<RecommendOutputProvider>();
    final vmWatch = context.watch<RecommendOutputProvider>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('견적서', style: Theme.of(context).textTheme.headline4),
            ),
            buildPartsList(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: ((context) => ExternalLinkDialog(
                          link: vmRead.totalLink[vmWatch.viewIndex])),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('구매링크',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      final messenger = ScaffoldMessenger.of(context);
                      messenger.showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('견적 정보가 저장되었습니다.'),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('저장하기',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ),
                ),
              ],
            )
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
      vmRead.monitor[vmWatch.viewIndex],
      vmRead.keyboard[vmWatch.viewIndex],
      vmRead.mouse[vmWatch.viewIndex],
    ];
    final itemNum = [
      vmRead.numCpu[vmWatch.viewIndex],
      vmRead.numVga[vmWatch.viewIndex],
      vmRead.numRam[vmWatch.viewIndex],
      vmRead.numMainboard[vmWatch.viewIndex],
      vmRead.numSsd[vmWatch.viewIndex],
      vmRead.numHdd[vmWatch.viewIndex],
      vmRead.numCooler[vmWatch.viewIndex],
      vmRead.numPower[vmWatch.viewIndex],
      vmRead.numCase[vmWatch.viewIndex],
      vmRead.numMonitor[vmWatch.viewIndex],
      vmRead.numKeyboard[vmWatch.viewIndex],
      vmRead.numMouse[vmWatch.viewIndex],
    ];
    final capacity = [
      1,
      1,
      4,
      1,
      2,
      4,
      1,
      1,
      1,
      99,
      99,
      99,
    ];
    final setNumFunc = [
      vmRead.setPartsCPUNum,
      vmRead.setPartsVGANum,
      vmRead.setPartsRAMNum,
      vmRead.setPartsMainboardNum,
      vmRead.setPartsSSDNum,
      vmRead.setPartsHDDNum,
      vmRead.setPartsCoolerNum,
      vmRead.setPartsPowerNum,
      vmRead.setPartsCaseNum,
      vmRead.setPartsMonitorNum,
      vmRead.setPartsKeyboardNum,
      vmRead.setPartsMouseNum,
    ];
    List<Widget> changeDialog = [
      buildChangeDialog(
          context, vmRead.getCPUReplacable(), (p0) => vmRead.setCPU(p0)),
      buildChangeDialog(
          context, vmRead.getVGAReplacable(), (p0) => vmRead.setVGA(p0)),
      buildChangeDialog(
          context, vmRead.getRAMReplacable(), (p0) => vmRead.setRAM(p0)),
      buildChangeDialog(context, vmRead.getMainboardReplacable(),
          (p0) => vmRead.setMainboard(p0)),
      buildChangeDialog(
          context, vmRead.getSSDReplacable(), (p0) => vmRead.setSSD(p0)),
      buildChangeDialog(
          context, vmRead.getHDDReplacable(), (p0) => vmRead.setHDD(p0)),
      buildChangeDialog(
          context, vmRead.getCoolerReplacable(), (p0) => vmRead.setCooler(p0)),
      buildChangeDialog(
          context, vmRead.getPowerReplacable(), (p0) => vmRead.setPower(p0)),
      buildChangeDialog(
          context, vmRead.getCaseReplacable(), (p0) => vmRead.setCase(p0)),
      buildChangeDialog(context, vmRead.getMonitorReplacable(),
          (p0) => vmRead.setMonitor(p0)),
      buildChangeDialog(context, vmRead.getKeyboardReplacable(),
          (p0) => vmRead.setKeyboard(p0)),
      buildChangeDialog(
          context, vmRead.getMouseReplacable(), (p0) => vmRead.setMouse(p0)),
    ];
    return Expanded(
      child: ListView(children: [
        for (int i = 0; i < itemList.length; ++i)
          Row(
            children: [
              Expanded(child: ComputerItemDisplayPartsBuilder(itemList[i])),
              if (itemNum[i] > 0)
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: capacity[i] > itemNum[i]
                          ? () {
                              setNumFunc[i](itemNum[i] + 1);
                            }
                          : null,
                      child: const Text('+1'),
                    ),
                  ),
                  Text(itemNum[i].toString(),
                      style: Theme.of(context).textTheme.headline6),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: itemNum[i] > 1
                          ? () {
                              setNumFunc[i](itemNum[i] - 1);
                            }
                          : null,
                      child: const Text('-1'),
                    ),
                  ),
                ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => showDialog(
                      context: context, builder: ((_) => changeDialog[i])),
                  child: Text(itemNum[i] > 0 ? '바꾸기' : '추가'),
                ),
              ),
              if (itemNum[i] > 0)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setNumFunc[i](0);
                    },
                    child: const Text('삭제'),
                  ),
                ),
            ],
          ),
      ]),
    );
  }

  Widget buildChangeDialog<T extends ComputerItem>(
      BuildContext context,
      Future<List<Future<T>>> replacable,
      void Function(Future<T>) setFunction) {
    return Shimmer(
      child: AlertDialog(
        title: Text('부품 선택하기', style: Theme.of(context).textTheme.headline4),
        content: FutureWidget(
          data: replacable,
          display: ((p0) => SingleChildScrollView(
                child: Column(
                  children: [
                    for (Future<T> p in p0)
                      Row(
                        children: [
                          Expanded(child: ComputerItemDisplayPartsBuilder(p)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setFunction(p);
                                Navigator.pop(context);
                              },
                              child: const Text('선택'),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              )),
          error: Container(),
          loading: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class RecommendOutputDisplayLoading extends StatelessWidget {
  final bool play;
  const RecommendOutputDisplayLoading({this.play = true, super.key});

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('CPU-GPU 호환성',
                  style: Theme.of(context).textTheme.headline4),
            ),
            Expanded(child: buildBottleneckChart(context)),
          ],
        ),
      ),
    );
  }

  Widget buildBottleneckChart(BuildContext context) {
    return BottleneckChartLoading(play: play);
  }

  Widget buildProgramFit(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('적합도', style: Theme.of(context).textTheme.headline4),
            ),
            buildProgramFitList(context),
          ],
        ),
      ),
    );
  }

  Widget buildProgramFitList(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          title: ShimmerLoading(
              play: play,
              child: const TextSpaceRoundRect(child: Text('리그오브레전드'))),
          subtitle: ProgramFitChartLoading(play: play),
        ),
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }

  Widget buildParts(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('견적서', style: Theme.of(context).textTheme.headline4),
            ),
            buildPartsList(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('구매링크',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('저장하기',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildPartsList(BuildContext context) {
    return Expanded(
      child: ListView(children: [
        for (int i = 0; i < 10; ++i)
          ComputerItemDisplayPartsLoading(play: play),
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

class NoBottleneckChart extends StatelessWidget {
  const NoBottleneckChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              startAngle: 180,
              canScaleToFit: true,
              endAngle: 0,
              interval: 10,
              useRangeColorForAxis: true,
            ),
          ],
        ),
        const Positioned.fill(
          child: ColoredBox(
            color: Color(0x88000000),
          ),
        ),
        Text(
          'GPU가 없습니다.',
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}

class BottleneckChartLoading extends StatelessWidget {
  const BottleneckChartLoading({this.play = true, super.key});
  final bool play;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      play: play,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                startAngle: 180,
                canScaleToFit: true,
                endAngle: 0,
                interval: 10,
                useRangeColorForAxis: true,
              ),
            ],
          ),
          const Positioned.fill(
            child: ColoredBox(
              color: Color(0x66000000),
            ),
          ),
        ],
      ),
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

class ProgramFitChartLoading extends StatelessWidget {
  const ProgramFitChartLoading({this.play = true, super.key});
  final bool play;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      play: play,
      child: Stack(children: [
        SfLinearGauge(
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
        ),
        const Positioned.fill(
          child: ColoredBox(
            color: Color(0x66000000),
          ),
        ),
      ]),
    );
  }
}
