import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/constants/stopwatch_constants.dart';
import '../../../core/palette.dart';

class StopwatchSecsTickMarker extends StatelessWidget {
  const StopwatchSecsTickMarker(
      {Key? key, required this.milliseconds, required this.radius})
      : super(key: key);

  final int milliseconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // color ticker white every 5 seconds
    final color = milliseconds % 5000 == 0 ? Palette.kWhite : Palette.kGrey;
    // taller marker to indicate each second
    final height = milliseconds % 1000 == 0
        ? StopwatchConst.kSecondsHeight
        : StopwatchConst.kMillisecondsHeight;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-StopwatchConst.kTickerWidth / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * milliseconds / (60.0 * 1000.0))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        width: StopwatchConst.kTickerWidth,
        height: height,
        color: color,
      ),
    );
  }
}
