part of '../../google_places_sdk.dart';

class LatLngCoords {
  final double? lat;
  final double? lng;

  const LatLngCoords({this.lat, this.lng});

  LatLngCoords copyWith({double? lat, double? lng}) =>
      _$LatLngCoordsCopyWith(this, lat: lat, lng: lng);

  Map<String, dynamic> toJson() => _$LatLngCoordsTojson(this);

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
