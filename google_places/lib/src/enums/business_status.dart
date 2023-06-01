part of google_places;

enum BusinessStatus {
  unknown("Unknown", -1),
  closedPermanently("ClosedPermanently ", 0),
  closedTemporarily("ClosedTemporarily ", 1),
  operational("Operational", 2);

  final String value;
  final int id;

  const BusinessStatus(this.value, this.id);
}
