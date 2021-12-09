import 'package:flutter/material.dart';

import '../../../../core/constants/stopwatch_constants.dart';
import '../../../../core/palette.dart';
import '../../../../core/widgets/widgets.dart';

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
        child: TimerButton(
          label: 'Lap',
          labelColor: Palette.kGreyText,
          color: Palette.kButtonDisabled,
          onPressed: () {},
        ),
      ),
    );
  }
}
