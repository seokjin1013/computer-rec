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
    return MaterialApp(
      title: '컴퓨터 견적 추천 시스템',
      theme: ThemeData(
        fontFamily: 'GMarketSans',
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.deepPurple,
        ),
      ),
      home: const MainPage(),
    );
  }
}
