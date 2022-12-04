import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(24.0),
      children: [
        Row(children: [
          const CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(text, style: Theme.of(context).textTheme.headline6),
          ),
        ]),
      ],
    );
  }
}
