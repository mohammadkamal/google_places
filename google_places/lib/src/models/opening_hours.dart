part of '../../google_places_sdk.dart';

class OpeningHours {
  final List<String>? weekdayText;
  final List<Period>? periods;

  const OpeningHours({this.weekdayText, this.periods});

  OpeningHours copyWith({List<String>? weekdayText, List<Period>? periods}) =>
      _$OpeningHoursCopyWith(this, weekdayText: weekdayText, periods: periods);

  Map<String, dynamic> toJson() => _$OpeningHoursToJson(this);

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
