import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../view_models/view_models.dart';

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
              thickness: 1,
            );
          },
          itemBuilder: (_, idx) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                'Lap ${model.laps.length - idx}',
                style: textTheme.subtitle1?.copyWith(color: Palette.kWhite),
              ),
            );
          },
        );
      }),
    );
  }
}
