import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class StopwatchTickerUI extends StatelessWidget {
  const StopwatchTickerUI({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0.0,
          right: 0.0,
          top: radius * 1.35,
          child: const StopwatchElapsedTimeText(
            elapsed: Duration(seconds: 0),
          ),
        ),
        Positioned(
          left: radius,
          top: radius,
          child: StopwatchHand(
            rotationZAngle: pi + 2 * pi / 60 * 5,
            handLength: radius,
          ),
        ),
        Positioned(
          left: radius,
          top: radius * 2 / 3,
          child: StopwatchHand(
            rotationZAngle: pi + 2 * pi / 30 * 5,
            handLength: radius / 4,
          ),
        ),
      ],
    );
  }
}
