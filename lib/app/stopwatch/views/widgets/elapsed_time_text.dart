import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';

class StopwatchElapsedTimeText extends StatelessWidget {
  const StopwatchElapsedTimeText({
    Key? key,
    required this.elapsed,
    required this.textStyle,
    required this.digitWidth,
    required this.mainAxisAlignment,
  }) : super(key: key);

  final Duration elapsed;
  final TextStyle? textStyle;
  final double digitWidth;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        TimeDigit(
          elapsed.minutes().substring(0, 1),
          width: digitWidth,
          textStyle: textStyle,
        ),
        TimeDigit(
          elapsed.minutes().substring(1, 2),
          width: digitWidth,
          textStyle: textStyle,
        ),
        TimeDigit(
          ':',
          width: 6,
          textStyle: textStyle,
        ),
        TimeDigit(
          elapsed.seconds().substring(0, 1),
          width: digitWidth,
          textStyle: textStyle,
        ),
        TimeDigit(
          elapsed.seconds().substring(1, 2),
          width: digitWidth,
          textStyle: textStyle,
        ),
        TimeDigit(
          '.',
          width: 6,
          textStyle: textStyle,
        ),
        TimeDigit(
          elapsed.hundreds().substring(0, 1),
          width: digitWidth,
          textStyle: textStyle,
        ),
        TimeDigit(
          elapsed.hundreds().substring(1, 2),
          width: digitWidth,
          textStyle: textStyle,
        ),
      ],
    );
  }
}

/// Wraps each digit in a sizedbox.
///
/// Maintains monospace between digits.
class TimeDigit extends StatelessWidget {
  const TimeDigit(
    this.text, {
    Key? key,
    required this.width,
    required this.textStyle,
  }) : super(key: key);

  final String text;
  final double width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
