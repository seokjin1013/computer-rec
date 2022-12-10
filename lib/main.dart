import 'package:clean_architecture_flutter/features/recommend/domain/entities/recommend_output.dart';
import 'package:clean_architecture_flutter/features/recommend/domain/entities/recommend_input.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/pages/recommend_input_page.dart';
import 'package:clean_architecture_flutter/features/recommend/presentation/pages/recommend_output_page.dart';
import 'package:flutter/material.dart';

import 'features/recommend/presentation/pages/main_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    RecommendInput recommendInput = RecommendInput(
      priorIntelCPU: true,
      priorAMDCPU: false,
      priceLow: 1000000,
      priceHigh: 2000000,
      purpose: 2,
    );
    return MaterialApp(
      title: '컴퓨터 견적 추천 시스템',
      theme: ThemeData(
        fontFamily: 'GMarketSans',
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(
          headline3: TextStyle(color: Color(0xFFEFEFEF)),
          headline4: TextStyle(color: Color(0xFFEFEFEF)),
          headline5: TextStyle(color: Color(0xFFEFEFEF)),
          headline6: TextStyle(color: Color(0xFFEFEFEF)),
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Color(0xFF7335BF),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7335BF),
          ),
        ),
      ),
      home: RecommendOutputPage(recommendInput: recommendInput),
      // home: const MainPage(),
    );
  }
}
