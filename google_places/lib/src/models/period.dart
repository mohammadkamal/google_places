part of '../../google_places_sdk.dart';

/// Represents a time segment. It may contain an open ```TimeOfWeek```, or a close ```TimeOfWeek```, or both.
class Period {
  final TimeOfWeek? close;
  final TimeOfWeek? open;

  /// Represents a time segment. It may contain an open ```TimeOfWeek```, or a close ```TimeOfWeek```, or both.
  ///
  /// For more information, visit [Period](https://developers.google.com/maps/documentation/places/android-sdk/reference/com/google/android/libraries/places/api/model/Period).
  const Period({this.close, this.open});

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
  Period copyWith({TimeOfWeek? close, TimeOfWeek? open}) =>
      _$PeriodCopyWith(this, close: close, open: open);

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$PeriodToJson(this);

  /// A constructor to parse a JSON ```Map```.
  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);

  @override
  String toString() => 'Period(close: $close, open: $open)';
}

Period _$PeriodCopyWith(
  Period value, {
  Object? close = const _ArgNotPassed(),
  Object? open = const _ArgNotPassed(),
}) {
  return Period(
    close: close is _ArgNotPassed ? value.close : close as TimeOfWeek?,
    open: open is _ArgNotPassed ? value.open : open as TimeOfWeek?,
  );
}

Map<String, dynamic> _$PeriodToJson(Period value) {
  return {'close': value.close?.toJson(), 'open': value.open?.toJson()};
}

Period _$PeriodFromJson(Map<String, dynamic> json) {
  return Period(
    close: json['close'] == null
        ? null
        : TimeOfWeek.fromJson(Map<String, dynamic>.from(json['close'])),
    open: json['open'] == null
        ? null
        : TimeOfWeek.fromJson(Map<String, dynamic>.from(json['open'])),
  );
}
