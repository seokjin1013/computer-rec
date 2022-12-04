import 'package:clean_architecture_flutter/features/recommend/presentation/pages/signin_page.dart';
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
    return const MaterialApp(
      title: '컴퓨터 견적 추천 시스템',
      home: SigninPage(),
    );
  }
}
