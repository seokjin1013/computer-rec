import 'dart:ui';

import 'package:clean_architecture_flutter/features/recommend/domain/entities/milestone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../features/recommend/presentation/widgets/milestone_display.dart';
import '../../injection_container.dart';

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
