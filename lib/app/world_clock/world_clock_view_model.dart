import 'package:flutter/widgets.dart';

class WorldClockViewModel extends ChangeNotifier {
  WorldClockViewModel() {
    _controller.addListener(_titleVisibilityListener);
  }

  void _titleVisibilityListener() {
    const double textHeight = 32.0;
    if (_controller.position.pixels > textHeight &&
        !_isWorldClockTitleVisible) {
      updateTitleVisibility(true);
    } else if (_controller.position.pixels < textHeight &&
        _isWorldClockTitleVisible) {
      updateTitleVisibility(false);
    }
  }

  ScrollController get controller => _controller;
  final ScrollController _controller = ScrollController();

  double get worldClockTitleOpacity => _isWorldClockTitleVisible ? 1.0 : 0.0;
  bool _isWorldClockTitleVisible = false;
  void updateTitleVisibility(bool value) {
    _isWorldClockTitleVisible = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
