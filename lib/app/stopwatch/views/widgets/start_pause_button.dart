import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/widgets.dart';
import '../../view_models/view_models.dart';

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
            label: model.startStopLabel,
            labelColor: model.startStopButtonLabelColor,
            color: model.startStopButtonColor,
            onPressed: context.read<StopwatchViewModel>().toggleRunning,
          );
        }),
      ),
    );
  }
}
