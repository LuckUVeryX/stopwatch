import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../view_model/stopwatch_viewmodel.dart';
import 'widgets/widgets.dart';

class StopwatchTickerUI extends StatefulWidget {
  const StopwatchTickerUI({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  @override
  State<StopwatchTickerUI> createState() => _StopwatchTickerUIState();
}

class _StopwatchTickerUIState extends State<StopwatchTickerUI>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;

  @override
  void initState() {
    final model = Provider.of<StopwatchViewModel>(context, listen: false);
    model.ticker = createTicker((elapsed) {
      setState(() {
        model.currentlyElapsed = elapsed;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StopwatchViewModel>(builder: (_, model, __) {
      return Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: widget.radius * 1.35,
            child: StopwatchElapsedTimeText(
              elapsed: model.elapsed,
            ),
          ),
          // * Seconds hand
          Positioned(
            left: widget.radius,
            top: widget.radius,
            child: StopwatchHand(
              rotationZAngle:
                  pi + 2 * pi / 60000 * (model.elapsed.inMilliseconds),
              handLength: widget.radius,
            ),
          ),
          // * Minutes hand
          Positioned(
            left: widget.radius,
            top: widget.radius * 2 / 3,
            child: StopwatchHand(
              rotationZAngle:
                  pi + 2 * pi / (30 * 60) * (model.elapsed.inSeconds),
              handLength: widget.radius / 4,
            ),
          ),
        ],
      );
    });
  }
}
