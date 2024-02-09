part of '../../google_places_sdk.dart';

class RectangularBounds {
  final LatLngCoords? northeast;
  final LatLngCoords? southwest;

  const RectangularBounds({required this.northeast, required this.southwest});

  RectangularBounds copyWith(
          {LatLngCoords? northeast, LatLngCoords? southwest}) =>
      _$RectangularBoundsCopyWith(this,
          northeast: northeast, southwest: southwest);

  Map<String, dynamic> toJson() => _$RectangularBoundsToJson(this);

  factory RectangularBounds.fromJson(Map<String, dynamic> json) =>
      _$RectangularBoundsFromJson(json);

  @override
  String toString() =>
      'RectangularBounds(northeast: $northeast, southwest: $southwest)';
}

RectangularBounds _$RectangularBoundsCopyWith(
  RectangularBounds value, {
  Object? northeast = const _ArgNotPassed(),
  Object? southwest = const _ArgNotPassed(),
}) {
  return RectangularBounds(
    northeast: northeast is _ArgNotPassed
        ? value.northeast
        : northeast as LatLngCoords?,
    southwest: southwest is _ArgNotPassed
        ? value.southwest
        : southwest as LatLngCoords?,
  );
}

Map<String, dynamic> _$RectangularBoundsToJson(RectangularBounds value) {
  return {
    'southwest': value.southwest?.toJson(),
    'northeast': value.northeast?.toJson(),
  };
}

RectangularBounds _$RectangularBoundsFromJson(Map<String, dynamic> json) {
  return RectangularBounds(
    northeast: json['northeast'] == null
        ? null
        : LatLngCoords.fromJson(Map<String, dynamic>.from(json['northeast'])),
    southwest: json['southwest'] == null
        ? null
        : LatLngCoords.fromJson(Map<String, dynamic>.from(json['southwest'])),
  );
}
