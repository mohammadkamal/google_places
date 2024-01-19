part of '../../google_places.dart';

class LatLngBounds {
  final LatLngCoords northeast;
  final LatLngCoords southwest;

  LatLngBounds({required this.northeast, required this.southwest});

  LatLngBounds copyWith({LatLngCoords? northeast, LatLngCoords? southwest}) {
    return LatLngBounds(
      northeast: northeast ?? this.northeast,
      southwest: southwest ?? this.southwest,
    );
  }

  Map<String, dynamic> toJson() =>
      {'southwest': southwest.toJson(), 'northeast': northeast.toJson()};

  factory LatLngBounds.fromJson(Map<String, dynamic> json) {
    return LatLngBounds(
      northeast:
          LatLngCoords.fromJson(Map<String, dynamic>.from(json['northeast'])),
      southwest:
          LatLngCoords.fromJson(Map<String, dynamic>.from(json['southwest'])),
    );
  }

  @override
  String toString() =>
      '$LatLngBounds(northeast: $northeast, southwest: $southwest)';
}
