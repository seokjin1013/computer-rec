import 'package:flutter/material.dart';

class SignTextField extends StatelessWidget {
  const SignTextField(this.name, this.textFormField,
      {super.key, this.flex = 4});
  final String name;
  final TextFormField textFormField;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            name,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
          flex: flex,
          child: textFormField,
        )
      ],
    );
  }
}
