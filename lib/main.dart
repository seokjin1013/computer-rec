import 'package:clean_architecture_flutter/features/recommend/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

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
    // RecommendInput recommendInput = RecommendInput(
    //   priorIntelCPU: true,
    //   priorAMDCPU: false,
    //   priceLow: 500000,
    //   priceHigh: 700000,
    //   purpose: 2,
    // );
    // GetComputerSSD getComputerItem = sl();
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
          color: Color.fromARGB(255, 138, 83, 206),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7335BF),
          ),
        ),
      ),
      // home: RecommendOutputPage(recommendInput: recommendInput),
      home: const MainPage(),
      // home: Center(
      //   child: FutureBuilder(
      //     future: getComputerItem(17000984),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         return snapshot.data!
      //             .fold((l) => Container(), (r) => ComputerItemDisplay3(r, 1));
      //       }
      //       return CircularProgressIndicator();
      //     },
      //   ),
      // ),
    );
  }
}
