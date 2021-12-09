import 'package:flutter/widgets.dart';

import '../../../core/constants/constants.dart';
import '../data/stopwatch_state.dart';
import 'view_models.dart';

class StopwatchViewModel extends ChangeNotifier {
  StopwatchViewModel(this._tickerModel) {
    pageController = PageController();
  }

  final StopwatchTickerViewModel _tickerModel;
  late final PageController pageController;

  static const _kStartLabel = 'Start';
  static const _kStopLabel = 'Stop';
  static const _kLapLabel = 'Lap';
  static const _kResetLabel = 'Reset';

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

  List<Duration> get laps => List.unmodifiable(_laps);
  final List<Duration> _laps = [];

  StopwatchState get state => _state;
  StopwatchState _state = StopwatchState.init;
  void _updateState(StopwatchState value) {
    _state = value;
    switch (value) {
      case StopwatchState.init:
        _laps.clear();
        _tickerModel.resetTimer();
        _startStopLabel = _kStartLabel;
        _lapResetLabel = _kLapLabel;
        _startStopButtonColor = Palette.kButtonGreen;
        _startStopButtonLabelColor = Palette.kGreenText;
        _lapResetButtonColor = Palette.kButtonDisabled;
        _lapResetButtonLabelColor = Palette.kGreyText;
        break;
      case StopwatchState.paused:
        _tickerModel.pauseTimer();
        _startStopLabel = _kStartLabel;
        _lapResetLabel = _kResetLabel;
        _startStopButtonColor = Palette.kButtonGreen;
        _startStopButtonLabelColor = Palette.kGreenText;
        _lapResetButtonColor = Palette.kButtonGrey;
        _lapResetButtonLabelColor = Palette.kWhite;
        break;
      case StopwatchState.running:
        _tickerModel.startTimer();
        _startStopLabel = _kStopLabel;
        _lapResetLabel = _kLapLabel;
        _startStopButtonColor = Palette.kButtonRed;
        _startStopButtonLabelColor = Palette.kRedText;
        _lapResetButtonColor = Palette.kButtonGrey;
        _lapResetButtonLabelColor = Palette.kWhite;
        break;
    }
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
        _lapOnPressed();
        break;
    }
  }

  void _lapOnPressed() {
    _laps.add(_tickerModel.lapTime);
    _tickerModel.resetLapTime();
    notifyListeners();
  }

  void _resetTimer() {
    _updateState(StopwatchState.init);
    notifyListeners();
  }
}
