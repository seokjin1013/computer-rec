import 'package:flutter/material.dart';
import '../widgets/sign_text_field_widget.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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

  void queryLogin(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    messenger.showSnackBar(const SnackBar(
      content: Text('아이디 또는 비밀번호가 맞지 않습니다.'),
    ));
    // formKey.currentState!.save();
    // if (formKey.currentState!.validate()) {
    //   final navigator = Navigator.of(context);
    //   final messenger = ScaffoldMessenger.of(context);
    //   showDialog(
    //     barrierDismissible: false,
    //     context: context,
    //     builder: ((context) => const ProgressDialog('로그인 중...')),
    //   );
    //   Future<bool> isValid = context.read<UserViewmodel>().queryLogin(id, pw);
    //   List value = await Future.wait([
    //     isValid,
    //     context.read<GlobalViewmodel>().ready,
    //   ]);
    //   navigator.pop();
    //   if (value[0]) {
    //     messenger.showSnackBar(const SnackBar(
    //       content: Text('로그인 성공!'),
    //     ));
    //     // navigator.push(
    //     //   MaterialPageRoute(
    //     //     builder: ((context) => const MenuPage()),
    //     //   ),
    //     // );
    //   } else {
    //     messenger.showSnackBar(const SnackBar(
    //       content: Text('아이디 또는 비밀번호가 맞지 않습니다.'),
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
                  child: Column(
                    children: [
                      SignTextField(
                        'ID',
                        TextFormField(
                          style: Theme.of(context).textTheme.headline5,
                          onFieldSubmitted: ((_) => queryLogin(context)),
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
                          onFieldSubmitted: ((_) => queryLogin(context)),
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
              ),
              Row(
                children: [
                  TextButton(
                    child: Text(
                      '회원가입',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const SignupPage()),
                      // );
                    },
                  ),
                  const Spacer(),
                  // TextButton(
                  //   child: Text('비밀번호 찾기',
                  //       style: Theme.of(context).textTheme.bodyText1),
                  //   onPressed: () {},
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
