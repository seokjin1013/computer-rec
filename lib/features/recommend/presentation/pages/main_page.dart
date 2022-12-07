import 'dart:convert';

import '../../domain/usecases/get_computer_item.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("컴퓨터 견적 추천 서비스"),
          actions: [
            TextButton(
                onPressed: () async {
                  // for (int i = 20; i < 21; ++i)
                  {
                    final http.Client client = sl();
                    int start = 1100000;
                    int end = 1500000;
                    String cpu = '인텔';
                    // int purpose = 2;
                    final response = await client.get(
                      Uri.parse(
                          'http://175.196.11.206:8080/combine/$start/$end/$cpu'),
                      headers: {
                        'Content-Type': 'application/json',
                      },
                    );
                    if (response.statusCode == 200) {
                      print(response.body);
                      // print(
                      //     '$start - $end : ${jsonDecode(response.body).length}');
                    } else {
                      print('error');
                    }
                  }
                },
                child: Text('견적 추천')),
            TextButton(
                onPressed: () async {
                  GetComputerCase getComputerItem = sl();
                  final result = await getComputerItem(10423167);
                  print(result);
                },
                child: Text('이전 기록')),
            TextButton(
                onPressed: () async {
                  final http.Client client = sl();
                  int id = 10423167;
                  final response = await client.get(
                    Uri.parse('http://175.196.11.206:8080/case/model/$id'),
                    headers: {
                      'Content-Type': 'application/json',
                    },
                  );
                  print(utf8.decode(response.bodyBytes));
                  if (response.statusCode == 200) {
                    Map map = jsonDecode(utf8.decode(response.bodyBytes));
                    for (var key in map.keys) print(key);
                    String str =
                        (map['details'] as String).replaceAll("'", '"');
                    for (var elem in jsonDecode(str)) {
                      print((elem as Map).entries.first.key);
                    }
                    // print(jsonDecode(str)[1]);
                  } else {
                    print('error');
                  }
                },
                child: Text('부품 목록')),
          ],
        ),
        body: Container());
  }
}
