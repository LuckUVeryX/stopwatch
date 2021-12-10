import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  AppPref.init() {
    _completeInit = init();
  }

  late SharedPreferences _prefs;

  Future<void> get initializationComplete => _completeInit;
  late Future<void> _completeInit;

  static const _kStopwatchPref = 'kStopwatchPref';
  int get stopwatchPref => _prefs.getInt(_kStopwatchPref) ?? 0;
  void setStopwatchPref(int value) => _prefs.setInt(_kStopwatchPref, value);

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
