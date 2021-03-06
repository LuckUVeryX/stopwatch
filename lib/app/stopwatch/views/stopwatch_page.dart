import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/constants.dart';
import '../../../core/services/services.dart';
import '../view_models/view_models.dart';
import 'laps_display.dart';
import 'stopwatch_widgets.dart';
import 'widgets/widgets.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  static const beamLocation = BeamPage(
    key: ValueKey('stopwatch'),
    child: StopwatchPage(),
    type: BeamPageType.noTransition,
  );
  static const path = '/stopwatch';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StopwatchTickerViewModel()),
        ChangeNotifierProvider(
          create: (context) => StopwatchViewModel(
            tickerModel: context.read<StopwatchTickerViewModel>(),
            initalPage: context.read<AppPref>().stopwatchPref,
          ),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 0.90,
                  child: LayoutBuilder(builder: (context, constraints) {
                    final radius = constraints.maxWidth / 2;
                    return Stack(
                      children: [
                        PageView(
                          onPageChanged:
                              context.read<AppPref>().setStopwatchPref,
                          physics: const ClampingScrollPhysics(),
                          controller:
                              context.read<StopwatchViewModel>().pageController,
                          children: [
                            SimpleStopwatch(radius: radius),
                            AnalogStopwatch(radius: radius),
                          ],
                        ),
                        const LapResetButton(),
                        const StartStopButton(),
                        const _PageIndicator(),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 16.0),
                const Divider(color: Palette.kDividerColor, thickness: 1),
                const LapsDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SmoothPageIndicator(
          controller: context.read<StopwatchViewModel>().pageController,
          count: 2,
          effect: ColorTransitionEffect(
            activeDotColor: Palette.kWhite,
            dotColor: Palette.kGrey,
            dotHeight: 8.0,
            dotWidth: 8.0,
          ),
        ),
      ),
    );
  }
}
