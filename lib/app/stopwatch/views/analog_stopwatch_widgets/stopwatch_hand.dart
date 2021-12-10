import 'package:flutter/material.dart';

class StopwatchHand extends StatelessWidget {
  const StopwatchHand({
    Key? key,
    required this.rotationZAngle,
    required this.handLength,
    required this.color,
    required this.handTailLength,
  }) : super(key: key);

  final double rotationZAngle;
  final double handLength;
  final double handTailLength;
  final Color color;

  static const _kHandThickness = 2.5;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-_kHandThickness / 2, 0.0)
        ..rotateZ(rotationZAngle)
        ..translate(0.0, -handTailLength, 0.0),
      child: Container(
        height: handLength + handTailLength,
        width: _kHandThickness,
        color: color,
      ),
    );
  }
}
