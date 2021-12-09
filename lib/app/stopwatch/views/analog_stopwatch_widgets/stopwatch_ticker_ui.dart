import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../view_models/view_models.dart';
import '../widgets/widgets.dart';
import 'analog_stopwatch_widgets.dart';

class StopwatchTickerUI extends StatelessWidget {
  const StopwatchTickerUI({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer<StopwatchTickerViewModel>(builder: (_, model, __) {
      return Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: radius * 1.35,
            child: StopwatchElapsedTimeText(
              elapsed: model.elapsed,
              textStyle: textTheme.headline6,
              digitWidth: StopwatchConst.kSmallDigitWidth,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          // * Seconds hand
          Positioned(
            left: radius,
            top: radius,
            child: StopwatchHand(
              rotationZAngle:
                  pi + 2 * pi / 60000 * (model.elapsed.inMilliseconds),
              handLength: radius,
            ),
          ),
          // * Minutes hand
          Positioned(
            left: radius,
            top: radius * 2 / 3,
            child: StopwatchHand(
              rotationZAngle:
                  pi + 2 * pi / (30 * 60) * (model.elapsed.inSeconds),
              handLength: radius / 4,
            ),
          ),
        ],
      );
    });
  }
}
