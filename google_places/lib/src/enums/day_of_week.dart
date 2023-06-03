part of google_places;

enum DayOfWeek {
  sunday(1),
  monday(2),
  tuesday(3),
  wednesday(4),
  thursday(5),
  friday(6),
  saturday(7);

  final int id;

  const DayOfWeek(this.id);
}

extension DayOfWeekX on DayOfWeek {
  int get dateTimeDay {
    switch (this) {
      case DayOfWeek.sunday:
        return DateTime.sunday;
      case DayOfWeek.monday:
        return DateTime.monday;
      case DayOfWeek.tuesday:
        return DateTime.tuesday;
      case DayOfWeek.wednesday:
        return DateTime.wednesday;
      case DayOfWeek.thursday:
        return DateTime.thursday;
      case DayOfWeek.friday:
        return DateTime.friday;
      case DayOfWeek.saturday:
        return DateTime.saturday;
    }
  }
}
