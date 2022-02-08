class HelperFunction {
  String durationToString(int duration) {
    final millisecondsStr = (duration % 100).floor().toString().padLeft(2, '0');
    final secondsStr =
        ((duration / 100) % 60).floor().toString().padLeft(2, '0');
    final minutesStr =
        ((duration / (100 * 60)) % 60).floor().toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr:$millisecondsStr';
  }
}
