import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/stopwatch_constants.dart';
import '../../../../core/widgets/widgets.dart';
import '../../view_model/view_model.dart';

class LapResetButton extends StatelessWidget {
  const LapResetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        height: StopwatchConst.kButtonSize,
        width: StopwatchConst.kButtonSize,
        child: Consumer<StopwatchViewModel>(builder: (context, model, _) {
          return TimerButton(
            label: model.lapResetLabel,
            labelColor: model.lapResetButtonLabelColor,
            color: model.lapResetButtonColor,
            onPressed: context.read<StopwatchViewModel>().lapResetOnPressed,
          );
        }),
      ),
    );
  }
}
