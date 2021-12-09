import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/constants.dart';
import 'core/router/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: Palette.kBlack),
      ),
    );
  }
}
