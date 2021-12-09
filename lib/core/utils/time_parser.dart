extension DurationParser on Duration {
  String hundreds() {
    final hundreds = ((inMilliseconds / 10) % 100);
    return hundreds.toStringAsFixed(0).padLeft(2, '0');
  }

  String minutes() {
    final minutes = inMinutes % 60;
    return minutes.toString().padLeft(2, '0');
  }

  String seconds() {
    final seconds = inSeconds % 60;
    return seconds.toString().padLeft(2, '0');
  }
}
