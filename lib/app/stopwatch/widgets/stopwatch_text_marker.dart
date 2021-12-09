import 'dart:math';

import 'package:flutter/material.dart';

// TODO: use for minutes marker as well
class StopwatchTextMarker extends StatelessWidget {
  const StopwatchTextMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
    required this.kBoxWidth,
    required this.kBoxHeight,
    required this.kRingPad,
  }) : super(key: key);

  final int value;
  final int maxValue;
  final double radius;
  final double kBoxWidth;
  final double kBoxHeight;
  final double kRingPad;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-kBoxWidth / 2, -kBoxHeight / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - kRingPad, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: kBoxWidth,
        height: kBoxHeight,
        child: Center(
          child: Text(
            (value / 1000).toStringAsFixed(0),
            style: textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
