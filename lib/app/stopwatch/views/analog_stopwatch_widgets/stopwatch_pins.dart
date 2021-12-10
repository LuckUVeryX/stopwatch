import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class StopwatchSecsPin extends StatelessWidget {
  const StopwatchSecsPin({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;
  static const _kStopwatchSecsPinSize = 8.0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: radius - _kStopwatchSecsPinSize / 2,
      top: radius - _kStopwatchSecsPinSize / 2,
      child: Container(
        width: _kStopwatchSecsPinSize,
        height: _kStopwatchSecsPinSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Palette.kBlack,
          border: Border.all(color: Palette.kOrange, width: 2),
        ),
      ),
    );
  }
}

class StopwatchMinPin extends StatelessWidget {
  const StopwatchMinPin({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;
  static const _kStopwatchMinPinSize = 6.0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: radius - _kStopwatchMinPinSize / 2,
      top: radius * 2 / 3 - _kStopwatchMinPinSize / 2,
      child: Container(
        width: _kStopwatchMinPinSize,
        height: _kStopwatchMinPinSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Palette.kOrange,
        ),
      ),
    );
  }
}
