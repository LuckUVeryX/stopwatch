import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';

import '../../app/stopwatch/views/stopwatch_page.dart';

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
