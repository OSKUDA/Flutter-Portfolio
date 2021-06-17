const Map<int, String> monthsInYear = {
  1: 'Jan',
  2: 'Feb',
  3: 'Mar',
  4: 'Apr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Aug',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: "Dec",
};

class MonthToString {
  String? convert(int monthNumber) {
    return monthsInYear[monthNumber];
  }
}
