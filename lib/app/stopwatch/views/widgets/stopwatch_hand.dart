import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class StopwatchHand extends StatelessWidget {
  const StopwatchHand({
    Key? key,
    required this.rotationZAngle,
    required this.handLength,
  }) : super(key: key);

  final double rotationZAngle;
  final double handLength;

  static const _kHandThickness = 2.0;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-_kHandThickness / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: _kHandThickness,
        color: Palette.kOrange,
      ),
    );
  }
}
