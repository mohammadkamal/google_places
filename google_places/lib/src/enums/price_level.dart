part of '../../google_places_sdk.dart';

enum PriceLevel {
  unknown(-1),
  free(0),
  cheap(1),
  medium(2),
  high(3),
  expensive(4);

  final int id;
  const PriceLevel(this.id);
}

class _PriceLevelConverter {
  PriceLevel fromJson(int value) => PriceLevel.values
      .firstWhere((e) => e.id == value, orElse: () => PriceLevel.unknown);

  int toJson(PriceLevel value) => value.id;
}
