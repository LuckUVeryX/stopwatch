import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../view_models/view_models.dart';
import 'widgets/elapsed_time_text.dart';

class LapsDisplay extends StatelessWidget {
  const LapsDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Flexible(
      child: Consumer<StopwatchViewModel>(builder: (_, model, __) {
        return ListView.separated(
          itemCount: model.laps.length,
          separatorBuilder: (_, __) {
            return const Divider(
              color: Palette.kDividerColor,
              thickness: 1.5,
            );
          },
          itemBuilder: (_, idx) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lap ${model.laps.length - idx}',
                    style: textTheme.subtitle1?.copyWith(color: Palette.kWhite),
                  ),
                  if (idx == 0) ...[
                    Consumer<StopwatchTickerViewModel>(builder: (_, model, __) {
                      return StopwatchElapsedTimeText(
                        elapsed: model.lapTime,
                        textStyle: textTheme.subtitle1,
                        digitWidth: 10.0,
                        mainAxisAlignment: MainAxisAlignment.end,
                      );
                    }),
                  ] else ...[
                    StopwatchElapsedTimeText(
                      elapsed: model.laps[model.laps.length - idx],
                      textStyle: textTheme.subtitle1,
                      digitWidth: 10.0,
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ],
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
