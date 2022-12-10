import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../domain/entities/milestone.dart';

class MilestoneDisplay extends StatefulWidget {
  final Milestone milestone;
  const MilestoneDisplay({required this.milestone, super.key});

  @override
  State<MilestoneDisplay> createState() => _MilestoneDisplayState();
}

class _MilestoneDisplayState extends State<MilestoneDisplay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 6,
      child: Text(
          '지금까지 ${widget.milestone.numUser}명의 유저가\n${widget.milestone.numUser}개의 조합을 맞췄어요.',
          style: Theme.of(context).textTheme.headline2),
    );
  }
}

class MilestoneLoadingDisplay extends StatelessWidget {
  const MilestoneLoadingDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MilestoneErrorDisplay extends StatelessWidget {
  final String message;
  const MilestoneErrorDisplay({this.message = '정보를 불러올 수 없습니다.', super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(message),
    );
  }
}
