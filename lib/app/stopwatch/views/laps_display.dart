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
          itemCount: model.laps.length + 1,
          separatorBuilder: (_, __) {
            return const Divider();
          },
          itemBuilder: (_, idx) {
            if (idx == model.laps.length) {
              return const SizedBox();
            }
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
                    Consumer<StopwatchTickerViewModel>(
                        builder: (_, tickerModel, __) {
                      return StopwatchElapsedTimeText(
                        elapsed: tickerModel.lapTime,
                        textStyle: textTheme.subtitle1,
                        digitWidth: 10.0,
                        mainAxisAlignment: MainAxisAlignment.end,
                      );
                    }),
                  ] else ...[
                    StopwatchElapsedTimeText(
                      elapsed: model.laps[idx],
                      textStyle: textTheme.subtitle1?.copyWith(
                        // * colors the fastest and slowest lap times
                        color: idx == model.fastestLapIdx
                            ? Palette.kGreenText
                            : idx == model.slowestLapIdx
                                ? Palette.kRedText
                                : null,
                      ),
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
