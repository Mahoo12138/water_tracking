extension DateUtils on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime justDay(
      {int yearOffset = 0, int monthOffset = 0, int dayOffset = 0}) {
    return DateTime(
        this.year + yearOffset, this.month + monthOffset, this.day + dayOffset);
  }

  DateTime firstDayOfMonth() {
    return DateTime(this.year, this.month, 1);
  }
}
