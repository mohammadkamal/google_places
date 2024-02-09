part of '../../google_places_sdk.dart';

/// Represents a local time with just hours and minutes.
class LocalTime {
  /// The hours in 24 hour format.
  final int? hours;

  final int? minutes;

  /// Represents a local time with just hours and minutes.
  ///
  /// For more information, visit [LocalTime](https://developers.google.com/maps/documentation/places/android-sdk/reference/com/google/android/libraries/places/api/model/LocalTime).
  const LocalTime({this.hours, this.minutes});

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
  LocalTime copyWith({int? hours, int? minutes}) =>
      _$LocalTimeCopyWith(this, hours: hours, minutes: minutes);

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$LocalTimeToJson(this);

  /// A constructor to parse a JSON ```Map```.
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
