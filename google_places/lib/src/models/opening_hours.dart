part of '../../google_places_sdk.dart';

/// Represents information on when a Place will be open during the week.
class OpeningHours {
  final List<String>? weekdayText;
  final List<Period>? periods;

  /// Represents information on when a Place will be open during the week.
  ///
  /// For more information, visit [OpeningHours](https://developers.google.com/maps/documentation/places/android-sdk/reference/com/google/android/libraries/places/api/model/OpeningHours).
  const OpeningHours({this.weekdayText, this.periods});

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
  OpeningHours copyWith({List<String>? weekdayText, List<Period>? periods}) =>
      _$OpeningHoursCopyWith(this, weekdayText: weekdayText, periods: periods);

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);

  /// A constructor to parse a JSON ```Map```.
  factory OpeningHours.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursFromJson(json);

  @override
  String toString() =>
      'OpeningHours(' 'weekdayText: $weekdayText, periods: $periods)';
}

OpeningHours _$OpeningHoursCopyWith(
  OpeningHours value, {
  Object? weekdayText = const _ArgNotPassed(),
  Object? periods = const _ArgNotPassed(),
}) {
  return OpeningHours(
    weekdayText: weekdayText is _ArgNotPassed
        ? value.weekdayText
        : weekdayText as List<String>?,
    periods:
        periods is _ArgNotPassed ? value.periods : periods as List<Period>?,
  );
}

Map<String, dynamic> _$OpeningHoursToJson(OpeningHours value) {
  return {
    'weekdayText': value.weekdayText,
    'periods': value.periods?.map((e) => e.toJson()).toList()
  };
}

OpeningHours _$OpeningHoursFromJson(Map<String, dynamic> json) {
  return OpeningHours(
      weekdayText: json['weekdayText'] == null
          ? null
          : List<String>.from(json['weekdayText']),
      periods: json['periods'] == null
          ? null
          : List<Map<String, dynamic>>.from(json['periods'])
              .map(Period.fromJson)
              .toList());
}
