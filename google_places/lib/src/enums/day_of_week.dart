part of google_places;

enum DayOfWeek {
  sunday(0),
  monday(1),
  tuesday(2),
  wednesday(3),
  thursday(4),
  friday(5),
  saturday(6);

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
