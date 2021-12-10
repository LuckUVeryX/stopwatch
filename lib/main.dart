import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/constants/constants.dart';
import 'core/router/beam_locations.dart';
import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppPref appPref = AppPref.init();
  await appPref.initializationComplete;
  runApp(
    Provider.value(value: appPref, child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [StopwatchLocation()],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MaterialApp.router(
        routerDelegate: _routerDelegate,
        routeInformationParser: BeamerParser(),
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: Palette.kBlack),
      ),
    );
  }
}
