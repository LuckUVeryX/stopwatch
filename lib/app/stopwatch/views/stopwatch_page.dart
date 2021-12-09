import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/view_model.dart';
import 'views.dart';
import 'widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  static const beamLocation =
      BeamPage(key: ValueKey('stopwatch'), child: StopwatchPage());
  static const path = '/stopwatch';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Consumer<StopwatchTickerViewModel>(
                                builder: (_, model, __) {
                                  return StopwatchElapsedTimeText(
                                    elapsed: model.elapsed,
                                    textStyle: textTheme.headline1
                                        ?.copyWith(fontSize: 96),
                                    digitWidth: constraints.maxWidth / 8,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  );
                                },
                              ),
                            ),
                            Stack(
                              children: [
                                StopwatchRender(radius: radius),
                                StopwatchTickerUI(radius: radius),
                              ],
                            ),
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
