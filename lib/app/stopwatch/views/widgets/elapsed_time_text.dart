import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';

class StopwatchElapsedTimeText extends StatelessWidget {
  const StopwatchElapsedTimeText({Key? key, required this.elapsed})
      : super(key: key);

  final Duration elapsed;

  static const _digitWidth = 12.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeDigit(elapsed.minutes().substring(0, 1), width: _digitWidth),
        TimeDigit(elapsed.minutes().substring(1, 2), width: _digitWidth),
        const TimeDigit(':', width: 6),
        TimeDigit(elapsed.seconds().substring(0, 1), width: _digitWidth),
        TimeDigit(elapsed.seconds().substring(1, 2), width: _digitWidth),
        const TimeDigit('.', width: 6),
        TimeDigit(elapsed.hundreds().substring(0, 1), width: _digitWidth),
        TimeDigit(elapsed.hundreds().substring(1, 2), width: _digitWidth),
      ],
    );
  }
}

/// Wraps each digit in a sizedbox.
///
/// Maintains monospace between digits.
class TimeDigit extends StatelessWidget {
  const TimeDigit(this.text, {Key? key, required this.width}) : super(key: key);
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      child: Center(
        child: Text(
          text,
          style: textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
