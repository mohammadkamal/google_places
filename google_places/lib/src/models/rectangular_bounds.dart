part of '../../google_places.dart';

class RectangularBounds {
  final LatLngCoords northeast;
  final LatLngCoords southwest;

  const RectangularBounds({required this.northeast, required this.southwest});

  RectangularBounds copyWith(
      {LatLngCoords? northeast, LatLngCoords? southwest}) {
    return RectangularBounds(
      northeast: northeast ?? this.northeast,
      southwest: southwest ?? this.southwest,
    );
  }

  Map<String, dynamic> toJson() =>
      {'southwest': southwest.toJson(), 'northeast': northeast.toJson()};

  factory RectangularBounds.fromJson(Map<String, dynamic> json) {
    return RectangularBounds(
      northeast:
          LatLngCoords.fromJson(Map<String, dynamic>.from(json['northeast'])),
      southwest:
          LatLngCoords.fromJson(Map<String, dynamic>.from(json['southwest'])),
    );
  }

  @override
  String toString() =>
      '$RectangularBounds(northeast: $northeast, southwest: $southwest)';
}
