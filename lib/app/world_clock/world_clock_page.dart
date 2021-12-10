import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'world_clock_view_model.dart';

class WorldClockPage extends StatelessWidget {
  const WorldClockPage({Key? key}) : super(key: key);

  static const beamLocation = BeamPage(
    key: ValueKey('world_clock'),
    child: WorldClockPage(),
    type: BeamPageType.noTransition,
  );
  static const path = '/world_clock';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => WorldClockViewModel())],
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<WorldClockViewModel>(builder: (_, model, __) {
            return AnimatedOpacity(
              opacity: model.worldClockTitleOpacity,
              duration: const Duration(milliseconds: 100),
              child: const Text('World Clock'),
            );
          }),
          leading: TextButton(
            onPressed: () {},
            child: const Text('Edit'),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Consumer<WorldClockViewModel>(builder: (_, model, __) {
            return ListView.separated(
              controller: model.controller,
              physics: const AlwaysScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Text('World Clock',
                      style: textTheme.headline4
                          ?.copyWith(fontWeight: FontWeight.bold));
                }
                return const SizedBox();
              },
              itemCount: 2,
            );
          }),
        ),
      ),
    );
  }
}
