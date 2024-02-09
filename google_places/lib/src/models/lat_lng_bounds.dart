part of '../../google_places_sdk.dart';

class LatLngBounds {
  final LatLngCoords? northeast;
  final LatLngCoords? southwest;

  const LatLngBounds({this.northeast, this.southwest});

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
  LatLngBounds copyWith({LatLngCoords? northeast, LatLngCoords? southwest}) =>
      _$LatLngBoundsCopyWith(this, northeast: northeast, southwest: southwest);

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$LatLngBoundsToJson(this);

  /// A constructor to parse a JSON ```Map```.
  factory LatLngBounds.fromJson(Map<String, dynamic> json) =>
      _$LatLngBoundsFromJson(json);

  @override
  String toString() =>
      'LatLngBounds(northeast: $northeast, southwest: $southwest)';
}

LatLngBounds _$LatLngBoundsCopyWith(
  LatLngBounds value, {
  Object? northeast = const _ArgNotPassed(),
  Object? southwest = const _ArgNotPassed(),
}) {
  return LatLngBounds(
    northeast: northeast is _ArgNotPassed
        ? value.northeast
        : northeast as LatLngCoords?,
    southwest: southwest is _ArgNotPassed
        ? value.southwest
        : southwest as LatLngCoords?,
  );
}

Map<String, dynamic> _$LatLngBoundsToJson(LatLngBounds value) {
  return {
    'southwest': value.southwest?.toJson(),
    'northeast': value.northeast?.toJson(),
  };
}

LatLngBounds _$LatLngBoundsFromJson(Map<String, dynamic> json) {
  return LatLngBounds(
    northeast: json['northeast'] == null
        ? null
        : LatLngCoords.fromJson(Map<String, dynamic>.from(json['northeast'])),
    southwest: json['southwest'] == null
        ? null
        : LatLngCoords.fromJson(Map<String, dynamic>.from(json['southwest'])),
  );
}
