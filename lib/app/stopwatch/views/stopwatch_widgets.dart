import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../view_models/view_models.dart';
import 'analog_stopwatch_widgets/analog_stopwatch_widgets.dart';
import 'widgets/widgets.dart';

class AnalogStopwatch extends StatelessWidget {
  const AnalogStopwatch({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  static const _kStopwatchPinSize = 8.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StopwatchRender(radius: radius),
        StopwatchTickerUI(radius: radius),
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
  }
}

class SimpleStopwatch extends StatelessWidget {
  const SimpleStopwatch({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<StopwatchTickerViewModel>(
        builder: (_, model, __) {
          return StopwatchElapsedTimeText(
            elapsed: model.elapsed,
            textStyle: textTheme.headline1
                ?.copyWith(fontSize: 96, color: Palette.kWhite),
            digitWidth: radius / 4,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          );
        },
      ),
    );
  }
}
