import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("컴퓨터 견적 추천 서비스"),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text: 'DOGS', icon: Icon(Icons.favorite)),
            Tab(text: 'CATS', icon: Icon(Icons.music_note)),
            Tab(text: 'BIRDS', icon: Icon(Icons.search)),
          ]),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('DOGS')),
            Center(child: Text('CATS')),
            Center(child: Text('BIRDS')),
          ],
        ),
      ),
    );
  }
}
