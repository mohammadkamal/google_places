part of '../../google_places_sdk.dart';

class Period {
  final TimeOfWeek? close;
  final TimeOfWeek? open;

  const Period({this.close, this.open});

  Period copyWith({TimeOfWeek? close, TimeOfWeek? open}) =>
      _$PeriodCopyWith(this, close: close, open: open);

  Map<String, dynamic> toJson() => _$PeriodToJson(this);

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
