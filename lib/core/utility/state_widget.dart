import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  final String message;
  final Widget child;
  const FailedWidget({required this.child, this.message = '', super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: IgnorePointer(
        child: Stack(
          children: [
            child,
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 6.0,
                  sigmaY: 6.0,
                ),
                child: Center(
                  child: Text(
                      '정보를 불러오지 못했습니다.${message.isNotEmpty ? '\n$message' : ''}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
