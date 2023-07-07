import 'dart:convert';

import 'package:flutter/services.dart';

abstract class RecommendLocalDataSource {
  Future<String> getTodayTip(int num);
}

class RecommendLocalDataSourceImpl implements RecommendLocalDataSource {
  @override
  Future<String> getTodayTip(int num) async {
    String rawData = await rootBundle.loadString('today_tips.json');
    List<dynamic> jsonData = json.decode(rawData);
    return jsonData[num];
  }
}
