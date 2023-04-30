part of google_places;

class TimeOfWeek {
  final DayOfWeek day;
  final LocalTime time;

  TimeOfWeek({required this.day, required this.time});

  TimeOfWeek copyWith(DayOfWeek? day, LocalTime? time) =>
      TimeOfWeek(day: day ?? this.day, time: time ?? this.time);

  Map<String, dynamic> toJson() => {'day': day.id, 'time': time.toJson()};

  factory TimeOfWeek.fromJson(Map<String, dynamic> json) => TimeOfWeek(
      day: DayOfWeek.values.firstWhere((e) => json['day'] == e.id),
      time: LocalTime.fromJson(Map<String, dynamic>.from(json['time'])));

  @override
  String toString() => '$TimeOfWeek(day: $day, time: $time)';
}
