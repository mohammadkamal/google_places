part of '../../google_places.dart';

class Period {
  final TimeOfWeek? close;
  final TimeOfWeek? open;

  const Period({this.close, this.open});

  Period copyWith({TimeOfWeek? close, TimeOfWeek? open}) =>
      Period(close: close ?? this.close, open: open ?? this.open);

  Map<String, dynamic> toJson() =>
      {'close': close?.toJson(), 'open': open?.toJson()};

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      close: json['close'] == null
          ? null
          : TimeOfWeek.fromJson(Map<String, dynamic>.from(json['close'])),
      open: json['open'] == null
          ? null
          : TimeOfWeek.fromJson(Map<String, dynamic>.from(json['open'])),
    );
  }

  @override
  String toString() => '$Period(close: $close, open: $open)';
}
