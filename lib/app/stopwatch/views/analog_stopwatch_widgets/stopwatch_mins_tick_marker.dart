import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class StopwatchMinsTickMarker extends StatelessWidget {
  const StopwatchMinsTickMarker({
    Key? key,
    required this.seconds,
    required this.radius,
  }) : super(key: key);

  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // color ticker white for every 5 minutes
    final color = seconds % (5 * 60) == 0 ? Palette.kWhite : Palette.kGrey;
    // taller marker to indicate every minute
    final height = seconds % 60 == 0
        ? StopwatchConst.kMinutesHeight
        : StopwatchConst.kHalfMinutesHeight;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-StopwatchConst.kTickerWidth / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * seconds / (30 * 60.0))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        width: StopwatchConst.kTickerWidth,
        height: height,
        color: color,
      ),
    );
  }
}
