import 'package:clean_architecture_flutter/features/recommend/presentation/provider/signin_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_architecture_flutter/injection_container.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  ChangeNotifierProvider buildBody(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => sl<SigninProvider>()),
      child: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '컴퓨터 견적 추천 시스템',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
