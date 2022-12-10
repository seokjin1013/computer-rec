import 'features/recommend/domain/entities/recommend_output.dart';
import 'features/recommend/domain/entities/recommend_input.dart';
import 'features/recommend/domain/usecases/get_computer_item.dart';
import 'features/recommend/presentation/pages/recommend_input_page.dart';
import 'features/recommend/presentation/pages/recommend_output_page.dart';
import 'features/recommend/presentation/widgets/computer_item_display.dart';
import 'features/recommend/presentation/widgets/computer_item_display2.dart';
import 'features/recommend/presentation/widgets/computer_item_display3.dart';
import 'package:flutter/material.dart';

import 'features/recommend/presentation/pages/main_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

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
      priceLow: 500000,
      priceHigh: 700000,
      purpose: 2,
    );
    GetComputerCooler getComputerItem = sl();
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
      // home: RecommendOutputPage(recommendInput: recommendInput),
      home: const MainPage(),
      // home: FutureBuilder(
      //   future: getComputerItem(14705225),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return snapshot.data!.fold((l) => Container(),
      //           (r) => ComputerItemDisplay2(computerItem: r));
      //     }
      //     return CircularProgressIndicator();
      //   },
      // ),
    );
  }
}
