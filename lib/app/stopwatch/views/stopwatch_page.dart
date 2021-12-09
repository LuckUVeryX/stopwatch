import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/stopwatch_constants.dart';
import '../../../core/palette.dart';
import '../../../core/widgets/timer_button.dart';
import '../view_model/stopwatch_viewmodel.dart';
import 'views.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StopwatchViewModel(),
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
                        StopwatchRender(radius: radius),
                        StopwatchTickerUI(radius: radius),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            height: StopwatchConst.kButtonSize,
                            width: StopwatchConst.kButtonSize,
                            child: TimerButton(
                              label: 'Lap',
                              labelColor: Palette.kGreyText,
                              color: Palette.kButtonDisabled,
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: StopwatchConst.kButtonSize,
                            width: StopwatchConst.kButtonSize,
                            child: TimerButton(
                              label: 'Start',
                              labelColor: Palette.kGreenText,
                              color: Palette.kButtonGreen,
                              onPressed: () {},
                            ),
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
      ),
    );
  }
}
