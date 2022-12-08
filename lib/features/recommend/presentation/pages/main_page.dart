import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_computer_item_best_range.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/provider/main_provider.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/widgets/computer_item_display.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/computer_item.dart';

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
      create: (context) => MainProvider(sl(), sl()),
      builder: (context, child) {
        final vmRead = context.read<MainProvider>();
        return buildContent(context);
      },
    );
  }

  Widget buildContent(BuildContext context) {
    final vmRead = context.read<MainProvider>();
    final data = vmRead.getComputerCPUBest(1);
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold(
            (l) => ComputerItemErrorDisplay(message: l.message),
            (r) => ComputerItemDisplay(computerItem: r),
          );
        }
        return const ComputerItemLoadingDisplay();
      },
    );
  }
}
