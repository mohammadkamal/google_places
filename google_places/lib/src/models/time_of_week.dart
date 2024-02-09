part of '../../google_places_sdk.dart';

class TimeOfWeek {
  final DayOfWeek? day;
  final LocalTime? time;

  const TimeOfWeek({this.day, this.time});

  TimeOfWeek copyWith({DayOfWeek? day, LocalTime? time}) =>
      _$TimeOfWeekCopyWith(this, day: day, time: time);

  Map<String, dynamic> toJson() => _$TimeOfWeekToJson(this);

  factory TimeOfWeek.fromJson(Map<String, dynamic> json) =>
      _$TimeOfWeekFromJson(json);

  @override
  String toString() => 'TimeOfWeek(day: $day, time: $time)';
}

TimeOfWeek _$TimeOfWeekCopyWith(
  TimeOfWeek value, {
  Object? day = const _ArgNotPassed(),
  Object? time = const _ArgNotPassed(),
}) {
  return TimeOfWeek(
    day: day is _ArgNotPassed ? value.day : day as DayOfWeek?,
    time: time is _ArgNotPassed ? value.time : time as LocalTime?,
  );
}

Map<String, dynamic> _$TimeOfWeekToJson(TimeOfWeek value) {
  return {
    'day': value.day == null ? null : _DayOfWeekConverter().toJson(value.day!),
    'time': value.time?.toJson(),
  };
}

TimeOfWeek _$TimeOfWeekFromJson(Map<String, dynamic> json) {
  return TimeOfWeek(
    day: json['day'] == null
        ? null
        : _DayOfWeekConverter().fromJson(json['day']),
    time: json['time'] == null
        ? null
        : LocalTime.fromJson(Map<String, dynamic>.from(json['time'])),
  );
}
