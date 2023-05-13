part of google_places;

class LocalTime {
  final int hours;
  final int minutes;

  LocalTime({required this.hours, required this.minutes});

  LocalTime copyWith({int? hours, int? minutes}) =>
      LocalTime(hours: hours ?? this.hours, minutes: minutes ?? this.minutes);

  Map<String, dynamic> toJson() => {'hours': hours, 'minutes': minutes};

  factory LocalTime.fromJson(Map<String, dynamic> json) =>
      LocalTime(hours: json['hours'], minutes: json['minutes']);

  @override
  String toString() => '$LocalTime(hours: $hours, minutes: $minutes)';
}
