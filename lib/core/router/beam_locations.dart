import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import '../../app/home/home.dart';
import '../../app/stopwatch/views/stopwatch_page.dart';
import '../../app/world_clock/world_clock_page.dart';

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    return [HomeWrapper.beamLocation];
  }

  @override
  List<Pattern> get pathPatterns => [HomeWrapper.path];
}

class WorldClockLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    return [WorldClockPage.beamLocation];
  }

  @override
  List<Pattern> get pathPatterns => [WorldClockPage.path];
}

class StopwatchLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
    BuildContext context,
    RouteInformationSerializable state,
  ) =>
      [StopwatchPage.beamLocation];

  @override
  List<Pattern> get pathPatterns => [StopwatchPage.path];
}
