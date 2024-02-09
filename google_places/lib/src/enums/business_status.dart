part of '../../google_places_sdk.dart';

enum BusinessStatus {
  unknown("Unknown", -1),
  closedPermanently("ClosedPermanently ", 0),
  closedTemporarily("ClosedTemporarily ", 1),
  operational("Operational", 2);

  final String value;
  final int id;

  const BusinessStatus(this.value, this.id);
}

class _BusinessStatusConverter {
  BusinessStatus fromJson(String value) {
    return BusinessStatus.values.firstWhere((e) => e.value == value,
        orElse: () => BusinessStatus.unknown);
  }

  String toJson(BusinessStatus status) => status.value;
}
