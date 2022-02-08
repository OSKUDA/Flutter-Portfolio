class Ticker {
  const Ticker();
  Stream<int> downTick({required int ticks}) {
    return Stream.periodic(
        const Duration(milliseconds: 10), (x) => ticks - x - 1);
  }

  Stream<int> upTick() {
    return Stream.periodic(const Duration(milliseconds: 10), (x) => x + 1);
  }
}
