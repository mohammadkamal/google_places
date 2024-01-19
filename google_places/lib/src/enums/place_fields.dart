part of '../../google_places.dart';

enum PlaceField {
  address("ADDRESS", 0),
  addressComponents("ADDRESS_COMPONENTS", 1),
  businessStatus("BUSINESS_STATUS", 2),
  curbsidePickup("CURBSIDE_PICKUP", 3),
  delivery("DELIVERY", 4),
  dineIn("DINE_IN", 5),
  iconBackgroundColor("ICON_BACKGROUND_COLOR", 6),
  iconUrl("ICON_URL", 7),
  id("ID", 8),
  latLng("LAT_LNG", 9),
  name("NAME", 10),
  openingHours("OPENING_HOURS", 11),
  phoneNumber("PHONE_NUMBER", 12),
  photoMetadatas("PHOTO_METADATAS", 13),
  plusCode("PLUS_CODE", 14),
  priceLevel("PRICE_LEVEL", 15),
  rating("RATING", 16),
  takeout("TAKEOUT", 17),
  types("TYPES", 18),
  userRatingsTotal("USER_RATINGS_TOTAL", 19),
  utcOffset("UTC_OFFSET", 20),
  viewport("VIEWPORT", 21),
  websiteUri("WEBSITE_URI", 22);

  final String value;
  final int fieldId;

  const PlaceField(this.value, this.fieldId);
}
