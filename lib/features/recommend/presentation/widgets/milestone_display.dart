import 'package:clean_architecture_flutter/core/utility/future_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utility/shimmer.dart';
import '../../domain/entities/milestone.dart';

class MilestoneDisplayBuilder extends StatelessWidget {
  const MilestoneDisplayBuilder(this.data, {super.key});
  final Future<Milestone> data;

  @override
  Widget build(BuildContext context) {
    return FutureWidget(
      data: data,
      display: ((p0) => MilestoneDisplay(p0)),
      error: const MilestoneDisplayLoading(play: false),
      loading: const MilestoneDisplayLoading(),
    );
  }
}

class MilestoneDisplay extends StatefulWidget {
  final Milestone milestone;
  const MilestoneDisplay(this.milestone, {super.key});

  @override
  State<MilestoneDisplay> createState() => MilestoneDisplayState();
}

class MilestoneDisplayState extends State<MilestoneDisplay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 6,
      child: Column(
        children: [
          Text('지금까지 ${widget.milestone.numUser}명의 유저가',
              style: Theme.of(context).textTheme.headline2),
          Text('${widget.milestone.numUsage}개의 조합을 맞췄어요.',
              style: Theme.of(context).textTheme.headline2),
        ],
      ),
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
              child: Text('지금까지 0명의 유저가',
                  style: Theme.of(context).textTheme.headline2),
            ),
          ),
          ShimmerLoading(
            play: play,
            child: TextSpaceRoundRect(
              child: Text('0개의 조합을 맞췄어요.',
                  style: Theme.of(context).textTheme.headline2),
            ),
          ),
        ],
      ),
    );
  }
}
