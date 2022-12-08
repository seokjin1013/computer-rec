import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item_best_range.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/provider/main_bloc.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/provider/main_provider.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../injection_container.dart';
import '../provider/main_state.dart';

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
      // body: Container(),
      // body: buildBody(context),
      body: buildBody(context),
    );
  }

  ChangeNotifierProvider buildBody(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl(),
      child: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context) {
    final vmRead = context.read<MainProvider>();
    final result = vmRead.getComputerCPUBestId(1);
    return ComputerItemDisplay(computerItem: 
  }
}
