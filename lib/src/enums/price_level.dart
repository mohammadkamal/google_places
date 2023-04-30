part of google_places;

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
