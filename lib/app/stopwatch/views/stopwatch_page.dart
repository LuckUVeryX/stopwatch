import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  aspectRatio: 1 / 1,
                  child: LayoutBuilder(builder: (context, constraints) {
                    final radius = constraints.maxWidth / 2;
                    return Stack(
                      children: [
                        StopwatchRender(radius: radius),
                        StopwatchTickerUI(radius: radius),
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
