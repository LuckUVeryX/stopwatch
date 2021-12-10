import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/beam_locations.dart';
import '../../core/router/beamer_keys.dart';
import 'bottom_navigation.dart';
import 'home_viewmodel.dart';

class HomeWrapper extends StatelessWidget {
  HomeWrapper({Key? key}) : super(key: key);

  static final beamLocation = BeamPage(
    key: const ValueKey('home_wrapper'),
    child: HomeWrapper(),
  );
  static const path = '/';

  final _routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [WorldClockLocation(), StopwatchLocation()],
    ),
  );
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(_routerDelegate),
      child: Scaffold(
        body: Beamer(
          routerDelegate: _routerDelegate,
          key: BeamerKey.home,
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
