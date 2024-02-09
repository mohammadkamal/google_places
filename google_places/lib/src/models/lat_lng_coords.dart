part of '../../google_places_sdk.dart';

class LatLngCoords {
  final double? lat;
  final double? lng;

  const LatLngCoords({this.lat, this.lng});

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
  LatLngCoords copyWith({double? lat, double? lng}) =>
      _$LatLngCoordsCopyWith(this, lat: lat, lng: lng);

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$LatLngCoordsTojson(this);

  /// A constructor to parse a JSON ```Map```.
  factory LatLngCoords.fromJson(Map<String, dynamic> json) =>
      _$LatLngCoordsFromJson(json);

  @override
  String toString() => 'LatLngCoords(lat: $lat, lng: $lng)';
}

LatLngCoords _$LatLngCoordsCopyWith(
  LatLngCoords value, {
  Object? lat = const _ArgNotPassed(),
  Object? lng = const _ArgNotPassed(),
}) {
  return LatLngCoords(
    lat: lat is _ArgNotPassed ? value.lat : lat as double?,
    lng: lng is _ArgNotPassed ? value.lng : lng as double?,
  );
}

Map<String, dynamic> _$LatLngCoordsTojson(LatLngCoords value) {
  return {'lat': value.lat, 'lng': value.lng};
}

LatLngCoords _$LatLngCoordsFromJson(Map<String, dynamic> json) {
  return LatLngCoords(lat: json['lat'], lng: json['lng']);
}
