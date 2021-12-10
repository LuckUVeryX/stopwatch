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
      beamLocations: [HomeLocation()],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MaterialApp.router(
        routerDelegate: _routerDelegate,
        routeInformationParser: BeamerParser(),
        theme: ThemeData.dark().copyWith(
          dividerTheme: const DividerThemeData(
            color: Palette.kDividerColor,
            thickness: 1.5,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Palette.kOrange),
          ),
          scaffoldBackgroundColor: Palette.kBlack,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Palette.kWhite,
                displayColor: Palette.kWhite,
              ),
          appBarTheme: const AppBarTheme(
            color: Palette.kBlack,
            iconTheme: IconThemeData(color: Palette.kOrange),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 0.0,
            backgroundColor: Palette.kBlack,
            selectedItemColor: Palette.kOrange,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
