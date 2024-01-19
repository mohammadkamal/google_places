part of '../../google_places_sdk.dart';

class OpeningHours {
  final List<String> weekdayText;
  final List<Period> periods;

  OpeningHours({required this.weekdayText, required this.periods});

  OpeningHours copyWith({List<String>? weekdayText, List<Period>? periods}) =>
      OpeningHours(
          weekdayText: weekdayText ?? this.weekdayText,
          periods: periods ?? this.periods);

  Map<String, dynamic> toJson() => {
        'weekdayText': weekdayText,
        'periods': periods.map((e) => e.toJson()).toList()
      };

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
      weekdayText: List<String>.from(json['weekdayText']),
      periods: List.from(json['periods'])
          .map((e) => Period.fromJson(Map<String, dynamic>.from(e)))
          .toList());

  @override
  String toString() =>
      '$OpeningHours(weekdayText: $weekdayText, periods: $periods)';
}
