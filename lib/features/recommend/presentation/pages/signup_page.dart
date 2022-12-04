import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../widgets/sign_text_field_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final pwTextEditingController = TextEditingController();
  final pwcTextEditingController = TextEditingController();
  final idFocusNode = FocusNode();
  final pwFocusNode = FocusNode();
  bool idInvalid = false;
  bool pwInvalid = false;

  String id = "";
  String pw = "";
  String pwc = "";

  void querySignup(BuildContext context) async {
    // formKey.currentState!.save();
    // if (formKey.currentState!.validate()) {
    //   showDialog(
    //     barrierDismissible: false,
    //     context: context,
    //     builder: ((context) => const ProgressDialog('회원가입 중...')),
    //   );
    //   final navigator = Navigator.of(context);
    //   final messenger = ScaffoldMessenger.of(context);
    //   final isValid = await context.read<UserViewmodel>().querySignup(id, pw);
    //   navigator.pop();
    //   if (isValid) {
    //     messenger.showSnackBar(const SnackBar(
    //       content: Text('회원가입 완료!'),
    //     ));
    //     navigator.pop();
    //   } else {
    //     messenger.showSnackBar(const SnackBar(
    //       content: Text('회원가입에 실패하였습니다.'),
    //     ));
    //   }
    // } else {
    //   if (idInvalid) {
    //     idFocusNode.requestFocus();
    //   } else if (pwInvalid) {
    //     pwFocusNode.requestFocus();
    //   }
    //   idInvalid = pwInvalid = false;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '컴퓨터 견적 추천 시스템',
                style: Theme.of(context).textTheme.headline5,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 240,
                    child: Column(
                      children: [
                        Expanded(
                          child: SignTextField(
                            'ID',
                            TextFormField(
                              style: Theme.of(context).textTheme.headline5,
                              onSaved: (newValue) => id = newValue ?? "",
                              focusNode: idFocusNode,
                              validator: (value) {
                                final regExp = RegExp(r"^[a-zA-Z0-9.]{8,}");
                                if (value == null || !regExp.hasMatch(value)) {
                                  idInvalid = true;
                                  return '대문자, 소문자, 숫자로 8자 이상';
                                }
                                idInvalid = false;
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 20,
                            ),
                            flex: 3,
                          ),
                        ),
                        Expanded(
                          child: SignTextField(
                            'PW',
                            TextFormField(
                              controller: pwTextEditingController,
                              style: Theme.of(context).textTheme.headline5,
                              onSaved: (newValue) => pw = newValue ?? "",
                              obscureText: true,
                              focusNode: pwFocusNode,
                              validator: (value) {
                                final regExp = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}');
                                if (value == null || !regExp.hasMatch(value)) {
                                  pwInvalid = true;
                                  return '대문자, 소문자, 숫자, 특수문자 각각 포함 8자 이상';
                                }
                                pwInvalid = false;
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              maxLength: 20,
                            ),
                            flex: 3,
                          ),
                        ),
                        Expanded(
                          child: SignTextField(
                            'PW 확인',
                            TextFormField(
                              controller: pwcTextEditingController,
                              style: Theme.of(context).textTheme.headline5,
                              onSaved: (newValue) => pwc = newValue ?? "",
                              obscureText: true,
                              validator: (value) {
                                if (pwTextEditingController.text != value) {
                                  return '비밀번호와 일치하지 않습니다.';
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                            flex: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (() => querySignup(context)),
                child: const Text(
                  '회원가입',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
