// tao ra luong Stream dem nguoc moi 1s se tra ve gia tri x tu 0 -> ticks
// tu do thoi gian con lai
class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
