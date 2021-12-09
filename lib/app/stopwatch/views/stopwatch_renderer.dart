import 'package:flutter/material.dart';

import '../../../core/constants/stopwatch_constants.dart';
import 'widgets/widgets.dart';

class StopwatchRender extends StatelessWidget {
  const StopwatchRender({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  static const kMaxSecs = 60;
  static const kMaxMin = 30;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        for (int ms = 0; ms < 60 * 1000; ms += 250)
          Positioned(
            left: radius,
            top: radius,
            child: StopwatchSecsTickMarker(
              milliseconds: ms,
              radius: radius,
            ),
          ),
        for (int sec = 5; sec <= kMaxSecs; sec += 5)
          Positioned(
            left: radius,
            top: radius,
            child: StopwatchTextMarker(
              value: sec,
              maxValue: kMaxSecs,
              radius: radius,
              textHeight: StopwatchConst.kTextMarkerHeight,
              textWidth: StopwatchConst.kTextMarkerWidth,
              ringPad: radius / 5,
              textStyle: textTheme.headline5,
            ),
          ),
        for (int s = 0; s < kMaxMin * 60; s += 30)
          Positioned(
            left: radius,
            top: radius * 2 / 3,
            child: StopwatchMinsTickMarker(
              seconds: s,
              radius: radius / 4,
            ),
          ),
        for (int min = 5; min <= kMaxMin; min += 5)
          Positioned(
            left: radius,
            top: radius * 2 / 3,
            child: StopwatchTextMarker(
              value: min,
              maxValue: kMaxMin,
              radius: radius * 2 / 3,
              textWidth: StopwatchConst.kTextMarkerWidth,
              textHeight: StopwatchConst.kTextMarkerHeight,
              ringPad: radius * 0.52,
              textStyle: textTheme.bodyText1,
            ),
          ),
      ],
    );
  }
}
