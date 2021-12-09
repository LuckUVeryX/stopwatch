import 'dart:math';

import 'package:flutter/material.dart';

class StopwatchTextMarker extends StatelessWidget {
  const StopwatchTextMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
    required this.textWidth,
    required this.textHeight,
    required this.ringPad,
    required this.textStyle,
  }) : super(key: key);

  final int value;
  final int maxValue;
  final double radius;
  final double textWidth;
  final double textHeight;
  final double ringPad;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-textWidth / 2, -textHeight / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - ringPad, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: textWidth,
        height: textHeight,
        child: Center(
          child: Text(
            value.toStringAsFixed(0),
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
