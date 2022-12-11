import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinkDialog extends StatelessWidget {
  final String link;
  const ExternalLinkDialog({required this.link, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('외부 웹사이트 구매페이지를 여시겠습니까?'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 600,
              child: Text(
                link,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('열기'),
          onPressed: () {
            launchUrl(Uri.parse(link));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
