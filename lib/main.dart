import 'features/recommend/presentation/pages/main_page.dart';
import 'features/recommend/presentation/pages/signin_page.dart';
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
    return MaterialApp(
      title: '컴퓨터 견적 추천 시스템',
      theme: ThemeData(
        brightness: Brightness.dark,
        indicatorColor: Colors.purpleAccent[700]!,
      ),
      home: const MainPage(),
    );
  }
}
