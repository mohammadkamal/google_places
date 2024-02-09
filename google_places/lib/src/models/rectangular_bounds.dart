part of '../../google_places_sdk.dart';

/// Represents a rectangle-shaped bounds around a geographical area, defined by the latitude-longitude coordinates of the ```southwest``` and ```northeast``` corners.
///
/// This type of bounds can be used for location biases and restrictions.
class RectangularBounds {
  final LatLngCoords? northeast;
  final LatLngCoords? southwest;

  /// Represents a rectangle-shaped bounds around a geographical area, defined by the latitude-longitude coordinates of the ```southwest``` and ```northeast``` corners.
  ///
  /// This type of bounds can be used for location biases and restrictions.
  ///
  /// For example:
  /// ```dart
  /// final latLng = LatLngCoords(lat: 0.0, lng: 0.0);
  ///
  /// final predictions = await GooglePlaces().getAutoCompletePredictions('Some Place',
  ///   locationBias: RectangularBounds(northeast: latLng, southwest: latLng),
  ///   locationRestriction: RectangularBounds(northeast: latLng, southwest: latLng),
  /// );
  /// ```
  ///
  /// For more information, visit [RectangularBounds](https://developers.google.com/maps/documentation/places/android-sdk/reference/com/google/android/libraries/places/api/model/RectangularBounds).
  const RectangularBounds({required this.northeast, required this.southwest});

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
  RectangularBounds copyWith(
          {LatLngCoords? northeast, LatLngCoords? southwest}) =>
      _$RectangularBoundsCopyWith(this,
          northeast: northeast, southwest: southwest);

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$RectangularBoundsToJson(this);

  /// A constructor to parse a JSON ```Map```.
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
