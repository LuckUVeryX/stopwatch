import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/view_models.dart';

import 'stopwatch_widgets.dart';
import 'widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  static const beamLocation =
      BeamPage(key: ValueKey('stopwatch'), child: StopwatchPage());
  static const path = '/stopwatch';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StopwatchTickerViewModel()),
        ChangeNotifierProvider(
          create: (context) =>
              StopwatchViewModel(context.read<StopwatchTickerViewModel>()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 0.90,
                  child: LayoutBuilder(builder: (context, constraints) {
                    final radius = constraints.maxWidth / 2;
                    return Stack(
                      children: [
                        PageView(
                          children: [
                            SimpleStopwatch(radius: radius),
                            AnalogStopwatch(radius: radius),
                          ],
                        ),
                        const LapResetButton(),
                        const StartStopButton(),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
