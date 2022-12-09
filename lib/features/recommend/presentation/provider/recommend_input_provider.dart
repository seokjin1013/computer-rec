import 'package:clean_architecture_flutter/features/recommend/domain/entities/computer_item.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/usecases/get_milestone.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_flutter/core/utility/dartz_x.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/milestone.dart';
import '../../domain/entities/recommend_input_list.dart';
import '../../domain/usecases/get_computer_item.dart';
import '../../domain/usecases/get_computer_item_best_range.dart';

class RecommendInputProvider with ChangeNotifier {
  RecommendInput recommendInput = RecommendInput();
}
