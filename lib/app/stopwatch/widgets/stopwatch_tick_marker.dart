import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/palette.dart';

class StopwatchTickMarker extends StatelessWidget {
  const StopwatchTickMarker(
      {Key? key, required this.milliseconds, required this.radius})
      : super(key: key);

  final int milliseconds;
  final double radius;

  static const _kWidth = 2.0;
  static const _kSecondsHeight = 12.0;
  static const _kMillisecondsHeight = 8.0;

  @override
  Widget build(BuildContext context) {
    // color ticker white every 5 seconds
    final color = milliseconds % 5000 == 0 ? Palette.kWhite : Palette.kGrey;
    // taller marker to indicate each second
    final height =
        milliseconds % 1000 == 0 ? _kSecondsHeight : _kMillisecondsHeight;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-_kWidth / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * milliseconds / (60.0 * 1000.0))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(width: 2.0, height: height, color: color),
    );
  }
}
