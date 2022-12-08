import 'package:clean_architecture_flutter/features/recommend/presentation/provider/main_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_computer_item.dart';
import '../../domain/usecases/get_computer_item_best_range.dart';

class MainProvider with ChangeNotifier {
  final GetComputerCPU getComputerCPU;
  final GetComputerCPUIdBestRange getComputerCPUIdBestRange;

  MainProvider(this.getComputerCPUIdBestRange, this.getComputerCPU);

  final Map<int, Future<int>> computerCPUBestId = {};

  Future<int> getComputerCPUBestId(int index) async {
    computerCPUBestId.putIfAbsent(index, () async {
      Either<Failure, List<int>> result = await getComputerCPUIdBestRange(index, index);
      GetComputerCPUBestIdState state = result.fold((failure) => Error(message: '서버와의 연결이 끊어졌습니다.'), (r) => r[0]);
      return value;
    });
    if ()) {
      return computerCPUBestId[index]!;
    }
  }
}
