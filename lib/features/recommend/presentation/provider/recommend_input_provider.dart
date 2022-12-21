import 'package:flutter/material.dart';

import '../../domain/entities/recommend_input.dart';

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
