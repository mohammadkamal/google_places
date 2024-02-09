part of '../../google_places_sdk.dart';

class LocalTime {
  final int? hours;
  final int? minutes;

  const LocalTime({this.hours, this.minutes});

  LocalTime copyWith({int? hours, int? minutes}) =>
      _$LocalTimeCopyWith(this, hours: hours, minutes: minutes);

  Map<String, dynamic> toJson() => _$LocalTimeToJson(this);

  factory LocalTime.fromJson(Map<String, dynamic> json) =>
      _$LocalTimeFromJson(json);

  @override
  String toString() => 'LocalTime(hours: $hours, minutes: $minutes)';
}

LocalTime _$LocalTimeCopyWith(
  LocalTime value, {
  Object? hours = const _ArgNotPassed(),
  Object? minutes = const _ArgNotPassed(),
}) {
  return LocalTime(
    hours: hours is _ArgNotPassed ? value.hours : hours as int?,
    minutes: minutes is _ArgNotPassed ? value.minutes : minutes as int?,
  );
}

Map<String, dynamic> _$LocalTimeToJson(LocalTime value) {
  return {'hours': value.hours, 'minutes': value.minutes};
}

LocalTime _$LocalTimeFromJson(Map<String, dynamic> json) {
  return LocalTime(hours: json['hours'], minutes: json['minutes']);
}
