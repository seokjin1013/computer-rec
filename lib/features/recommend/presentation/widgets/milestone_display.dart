import 'package:flutter/material.dart';

import '../../../../core/utility/shimmer.dart';
import '../../domain/entities/milestone.dart';

class MilestoneDisplay extends StatefulWidget {
  final Milestone milestone;
  const MilestoneDisplay(this.milestone, {super.key});

  @override
  State<MilestoneDisplay> createState() => _MilestoneDisplayState();
}

class _MilestoneDisplayState extends State<MilestoneDisplay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 6,
      child: Text(
          '지금까지 ${widget.milestone.numUser}명의 유저가\n${widget.milestone.numUsage}개의 조합을 맞췄어요.',
          style: Theme.of(context).textTheme.headline2),
    );
  }
}

class MilestoneDisplayLoading extends StatelessWidget {
  const MilestoneDisplayLoading({this.play = true, super.key});
  final bool play;
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 6,
      child: Column(
        children: [
          ShimmerLoading(
            play: play,
            child: TextSpaceRoundRect(
              text: Text('지금까지 0명의 유저가',
                  style: Theme.of(context).textTheme.headline2),
            ),
          ),
          ShimmerLoading(
            play: play,
            child: TextSpaceRoundRect(
              text: Text('0개의 조합을 맞췄어요.',
                  style: Theme.of(context).textTheme.headline2),
            ),
          ),
        ],
      ),
    );
  }
}
