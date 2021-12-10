import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';

import '../../core/router/beam_locations.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._beamerDelegate) {
    _beamerDelegate.addListener(_beamerDelegateListener);
  }

  final BeamerDelegate _beamerDelegate;

  final List<BeamLocation> _tabsList = List.from([
    WorldClockLocation(),
    StopwatchLocation(),
  ]);

  int get currentIdx {
    return _tabsList.indexWhere((loc) =>
        loc.runtimeType == _beamerDelegate.currentBeamLocation.runtimeType);
  }

  void updateTabIdx(int value) {
    _beamerDelegate.beamTo(_tabsList[value]);
  }

  void _beamerDelegateListener() => notifyListeners();

  @override
  void dispose() {
    _beamerDelegate.removeListener(_beamerDelegateListener);
    super.dispose();
  }
}
