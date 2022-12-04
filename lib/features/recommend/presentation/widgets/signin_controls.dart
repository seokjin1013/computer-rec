import '../provider/signin_bloc.dart';
import '../provider/signin_event.dart';
import '../provider/signin_state.dart';
import 'progress_dialog_widget.dart';
import 'sign_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SigninControls extends StatefulWidget {
  const SigninControls({super.key});

  @override
  State<SigninControls> createState() => _SigninControlsState();
}

class _SigninControlsState extends State<SigninControls> {
  final formKey = GlobalKey<FormState>();
  final idFocusNode = FocusNode();
  final pwFocusNode = FocusNode();
  bool idInvalid = false;
  bool pwInvalid = false;

  @override
  void dispose() {
    idFocusNode.dispose();
    pwFocusNode.dispose();
    super.dispose();
  }

  String id = "";
  String pw = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SignTextField(
              'ID',
              TextFormField(
                style: Theme.of(context).textTheme.headline5,
                onFieldSubmitted: ((_) => queryLogin()),
                onSaved: (newValue) => id = newValue ?? "",
                focusNode: idFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    idInvalid = true;
                    return '아이디를 입력해주세요.';
                  }
                  return null;
                },
              ),
            ),
            SignTextField(
              'PW',
              TextFormField(
                style: Theme.of(context).textTheme.headline5,
                onFieldSubmitted: ((_) => queryLogin()),
                onSaved: (newValue) => pw = newValue ?? "",
                focusNode: pwFocusNode,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    pwInvalid = true;
                    return '비밀번호를 입력해주세요.';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void queryLogin() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      BlocProvider.of<SigninBloc>(context).add(CheckExistAccount(id, pw));
    } else {
      if (idInvalid) {
        idFocusNode.requestFocus();
      } else if (pwInvalid) {
        pwFocusNode.requestFocus();
      }
      idInvalid = pwInvalid = false;
    }
  }
}
