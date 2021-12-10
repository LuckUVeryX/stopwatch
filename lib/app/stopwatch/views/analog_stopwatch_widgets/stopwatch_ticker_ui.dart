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

  static const _kStopwatchPinSize = 8.0;

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
          // * Laps hand
          if (context.read<StopwatchViewModel>().laps.length > 1) ...[
            Positioned(
              left: radius,
              top: radius,
              child: StopwatchHand(
                rotationZAngle:
                    pi + 2 * pi / 60000 * model.lapTime.inMilliseconds,
                handLength: radius,
                color: Colors.blue,
              ),
            )
          ],
          // * Seconds hand
          Positioned(
            left: radius,
            top: radius,
            child: StopwatchHand(
              rotationZAngle:
                  pi + 2 * pi / 60000 * model.elapsed.inMilliseconds,
              handLength: radius,
              color: Palette.kOrange,
            ),
          ),
          // * Minutes hand
          Positioned(
            left: radius,
            top: radius * 2 / 3,
            child: StopwatchHand(
              rotationZAngle: pi + 2 * pi / (30 * 60) * model.elapsed.inSeconds,
              handLength: radius / 4,
              color: Palette.kOrange,
            ),
          ),

          Positioned(
            left: radius - _kStopwatchPinSize / 2,
            top: radius - _kStopwatchPinSize / 2,
            child: Container(
              width: _kStopwatchPinSize,
              height: _kStopwatchPinSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.kBlack,
                border: Border.all(color: Palette.kOrange, width: 2),
              ),
            ),
          ),
        ],
      );
    });
  }
}
