import 'dart:math';

import 'package:flutter/material.dart';

class StopwatchTextMarker extends StatelessWidget {
  const StopwatchTextMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);

  final int value;
  final int maxValue;
  final double radius;

  static const _kBoxWidth = 40.0;
  static const _kBoxHeight = 32.0;
  static const _kRingPad = 32.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-_kBoxWidth / 2, -_kBoxHeight / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - _kRingPad, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: _kBoxWidth,
        height: _kBoxHeight,
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
