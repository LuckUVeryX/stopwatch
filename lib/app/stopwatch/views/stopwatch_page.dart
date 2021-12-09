import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/constants/stopwatch_constants.dart';
import 'widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  static const kMaxSecs = 60;
  static const kMaxMin = 30;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: LayoutBuilder(builder: (context, constraints) {
                  final radius = constraints.maxWidth / 2;
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
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        top: radius * 1.35,
                        child: const StopwatchElapsedTimeText(
                          elapsed: Duration(seconds: 0),
                        ),
                      ),
                      Positioned(
                        left: radius,
                        top: radius,
                        child: StopwatchHand(
                          rotationZAngle: pi + 2 * pi / 60 * 5,
                          handLength: radius,
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
                      Positioned(
                        left: radius,
                        top: radius * 2 / 3,
                        child: StopwatchHand(
                          rotationZAngle: pi + 2 * pi / 30 * 5,
                          handLength: radius / 4,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
