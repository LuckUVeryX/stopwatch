import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

import '../../../core/constants/palette.dart';

enum StopwatchState { init, paused, running }

class StopwatchViewModel extends ChangeNotifier {
  static const _kStartLabel = 'Start';
  static const _kStopLabel = 'Stop';
  static const _kLapLabel = 'Lap';
  static const _kResetLabel = 'Reset';

  late final Ticker _ticker;
  set ticker(Ticker ticker) {
    _ticker = ticker;
  }

  void startTimer() {
    _ticker.start();
    _state = StopwatchState.running;
    notifyListeners();
  }

  StopwatchState get state => _state;
  StopwatchState _state = StopwatchState.init;
  void _updateState(StopwatchState value) {
    _state = value;
    switch (value) {
      case StopwatchState.init:
        _ticker.stop();
        _currentlyElapsed = Duration.zero;
        _previouslyElapsed = Duration.zero;
        _startStopLabel = _kStartLabel;
        _lapResetLabel = _kLapLabel;
        _startStopButtonColor = Palette.kButtonGreen;
        _startStopButtonLabelColor = Palette.kGreenText;
        _lapResetButtonColor = Palette.kButtonDisabled;
        _lapResetButtonLabelColor = Palette.kGreyText;
        break;
      case StopwatchState.paused:
        _ticker.stop();
        _previouslyElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
        _ticker.stop();
        _startStopLabel = _kStartLabel;
        _lapResetLabel = _kResetLabel;
        _startStopButtonColor = Palette.kButtonGreen;
        _startStopButtonLabelColor = Palette.kGreenText;
        _lapResetButtonColor = Palette.kButtonGrey;
        _lapResetButtonLabelColor = Palette.kWhite;
        break;
      case StopwatchState.running:
        _ticker.start();
        _startStopLabel = _kStopLabel;
        _lapResetLabel = _kLapLabel;
        _startStopButtonColor = Palette.kButtonRed;
        _startStopButtonLabelColor = Palette.kRedText;
        _lapResetButtonColor = Palette.kButtonGrey;
        _lapResetButtonLabelColor = Palette.kWhite;
        break;
    }
  }

  String get startStopLabel => _startStopLabel;
  String _startStopLabel = _kStartLabel;

  String get lapResetLabel => _lapResetLabel;
  String _lapResetLabel = _kLapLabel;

  Color get startStopButtonColor => _startStopButtonColor;
  Color _startStopButtonColor = Palette.kButtonGreen;

  Color get startStopButtonLabelColor => _startStopButtonLabelColor;
  Color _startStopButtonLabelColor = Palette.kGreenText;

  Color get lapResetButtonColor => _lapResetButtonColor;
  Color _lapResetButtonColor = Palette.kButtonDisabled;

  Color get lapResetButtonLabelColor => _lapResetButtonLabelColor;
  Color _lapResetButtonLabelColor = Palette.kGreyText;

  Duration get elapsed => _currentlyElapsed + _previouslyElapsed;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  set currentlyElapsed(Duration elapsed) {
    _currentlyElapsed = elapsed;
  }

  void toggleRunning() {
    switch (_state) {
      case StopwatchState.init:
        _updateState(StopwatchState.running);
        break;
      case StopwatchState.paused:
        _updateState(StopwatchState.running);
        break;
      case StopwatchState.running:
        _updateState(StopwatchState.paused);
        break;
    }
    notifyListeners();
  }

  void lapResetOnPressed() {
    switch (_state) {
      case StopwatchState.init:
        /* Do nothing because timer is not running */
        break;
      case StopwatchState.paused:
        _resetTimer();
        break;
      case StopwatchState.running:
        _lap();
        break;
    }
  }

  void _lap() {
    notifyListeners();
  }

  void _resetTimer() {
    _updateState(StopwatchState.init);
    notifyListeners();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
