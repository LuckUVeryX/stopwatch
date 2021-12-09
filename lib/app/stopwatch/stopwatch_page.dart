import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/constants/stopwatch_constants.dart';
import 'widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      for (int s = 5000; s <= 60 * 1000; s += 5000)
                        Positioned(
                          left: radius,
                          top: radius,
                          child: StopwatchTextMarker(
                            value: s,
                            maxValue: 60000,
                            radius: radius,
                            kBoxHeight: StopwatchConst.kTextMarkerHeight,
                            kBoxWidth: StopwatchConst.kTextMarkerWidth,
                            kRingPad: StopwatchConst.kTextMarkerPad,
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
                        child: StopwatchSecsHand(
                          rotationZAngle: pi + (2 * pi / 60000) * 5000,
                          handLength: radius,
                        ),
                      ),
                      for (int s = 0; s < 30 * 60; s += 30)
                        Positioned(
                          left: radius,
                          top: radius * 2 / 3,
                          child: StopwatchMinsTickMarker(
                            seconds: s,
                            radius: radius / 4,
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
