part of '../../google_places_sdk.dart';

class LatLngCoords {
  final double lat;
  final double lng;

  LatLngCoords({required this.lat, required this.lng});

  LatLngCoords copyWith({double? lat, double? lng}) =>
      LatLngCoords(lat: lat ?? this.lat, lng: lng ?? this.lng);

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};

  factory LatLngCoords.fromJson(Map<String, dynamic> json) =>
      LatLngCoords(lat: json['lat'], lng: json['lng']);

  @override
  String toString() => '$LatLngCoords(lat: $lat, lng: $lng)';
}
