import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

/// Contains state logic for widgets that need to update at 60FPS.
///
/// Other state should be handled by [StopwatchViewModel]
class StopwatchTickerViewModel extends ChangeNotifier {
  StopwatchTickerViewModel() {
    _ticker = Ticker((elapsed) {
      _currentlyElapsed = elapsed;
      _lapTime = elapsed;
      notifyListeners();
    });
  }

  late final Ticker _ticker;

  void startTimer() {
    _ticker.start();
    notifyListeners();
  }

  void resetTimer() {
    _ticker.stop();
    _currentlyElapsed = Duration.zero;
    _previouslyElapsed = Duration.zero;
    _lapTime = Duration.zero;
    _totalTimeBeforeLap = Duration.zero;
    notifyListeners();
  }

  void pauseTimer() {
    _ticker.stop();
    _previouslyElapsed += _currentlyElapsed;
    _currentlyElapsed = Duration.zero;
    _lapTime = Duration.zero;
    notifyListeners();
  }

  Duration get elapsed => _currentlyElapsed + _previouslyElapsed;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  set currentlyElapsed(Duration elapsed) {
    _currentlyElapsed = elapsed;
  }

  Duration _totalTimeBeforeLap = Duration.zero;
  Duration get lapTime => _lapTime + _previouslyElapsed - _totalTimeBeforeLap;
  Duration _lapTime = Duration.zero;
  void resetLapTime() {
    _totalTimeBeforeLap = elapsed;
    _lapTime = Duration.zero;
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
