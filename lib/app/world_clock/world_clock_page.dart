import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

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
    return const Scaffold(
      body: Center(
        child: Text('World Clock'),
      ),
    );
  }
}
