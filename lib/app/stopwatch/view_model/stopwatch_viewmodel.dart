import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

class StopwatchViewModel extends ChangeNotifier {
  late final Ticker _ticker;
  set ticker(Ticker ticker) {
    _ticker = ticker;
  }

  void startTimer() => _ticker.start();

  Duration get elapsed => _currentlyElapsed + _previouslyElapsed;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  set currentlyElapsed(Duration elapsed) {
    _currentlyElapsed = elapsed;
  }

  bool get isRunning => _isRunning;
  bool _isRunning = false;
  void toggleRunning() {
    _isRunning = !_isRunning;
    if (_isRunning) {
      _ticker.start();
    } else {
      _ticker.stop();
      _previouslyElapsed += _currentlyElapsed;
      currentlyElapsed = Duration.zero;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
