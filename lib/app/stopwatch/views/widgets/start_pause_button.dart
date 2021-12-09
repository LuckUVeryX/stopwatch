import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/stopwatch_constants.dart';
import '../../../../core/palette.dart';
import '../../../../core/widgets/widgets.dart';
import '../../view_model/stopwatch_viewmodel.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: StopwatchConst.kButtonSize,
        width: StopwatchConst.kButtonSize,
        child: Consumer<StopwatchViewModel>(builder: (context, model, _) {
          return TimerButton(
            label: model.isRunning ? 'Stop' : 'Start',
            labelColor: model.isRunning ? Palette.kRedText : Palette.kGreenText,
            color: model.isRunning ? Palette.kButtonRed : Palette.kButtonGreen,
            onPressed: context.read<StopwatchViewModel>().toggleRunning,
          );
        }),
      ),
    );
  }
}
