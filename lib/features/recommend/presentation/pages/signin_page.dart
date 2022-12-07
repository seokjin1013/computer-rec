import 'menu_page.dart';
import '../provider/signin_bloc.dart';
import '../widgets/signin_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';

import '../provider/signin_state.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  BlocProvider<SigninBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: ((context) => sl<SigninBloc>()),
      child: BlocListener<SigninBloc, SigninState>(
        listener: blocListener,
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
                const SigninControls(),
                buildResult(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void blocListener(context, state) {
    if (state is Loaded) {
      if (state.isExist) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MenuPage()),
        );
      }
    }
  }

  Widget buildResult(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline6;
    return Container(
      alignment: Alignment.center,
      child: BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state) {
          if (state is Empty) {
            return const SizedBox.shrink();
          } else if (state is Loading) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text("로그인 중...", style: textStyle),
                ),
              ],
            );
          } else if (state is Loaded) {
            if (state.isExist) {
              return const SizedBox.shrink();
            } else {
              return Text("해당 계정이 존재하지 않습니다.", style: textStyle);
            }
          } else if (state is Error) {
            return Text(state.message, style: textStyle);
          }
          throw 'error';
        },
      ),
    );
  }
}
