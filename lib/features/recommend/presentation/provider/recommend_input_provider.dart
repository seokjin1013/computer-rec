import '../../domain/entities/computer_item.dart';
import '../../domain/usecases/get_milestone.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/utility/dartz_x.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/milestone.dart';
import '../../domain/entities/recommend_input.dart';
import '../../domain/usecases/get_computer_item.dart';
import '../../domain/usecases/get_computer_item_best_range.dart';

class RecommendInputProvider with ChangeNotifier {
  RecommendInput recommendInput = RecommendInput();

  get priorIntelCPU => recommendInput.priorIntelCPU;
  void togglePriorIntelCPU() {
    recommendInput.priorIntelCPU = !recommendInput.priorIntelCPU;
    if (!recommendInput.priorIntelCPU && !recommendInput.priorAMDCPU) {
      recommendInput.priorAMDCPU = true;
    }
    notifyListeners();
  }

  get priorAMDCPU => recommendInput.priorAMDCPU;
  void togglePriorAMDCPU() {
    recommendInput.priorAMDCPU = !recommendInput.priorAMDCPU;
    if (!recommendInput.priorIntelCPU && !recommendInput.priorAMDCPU) {
      recommendInput.priorIntelCPU = true;
    }
    notifyListeners();
  }

  get purpose => recommendInput.purpose;
  void setPurpose(int value) {
    recommendInput.purpose = value;
    notifyListeners();
  }

  get priceLow => recommendInput.priceLow;
  get priceHigh => recommendInput.priceHigh;
  void setPrice(int priceLow, int priceHigh) {
    recommendInput.priceLow = priceLow;
    recommendInput.priceHigh = priceHigh;
    notifyListeners();
  }
}
