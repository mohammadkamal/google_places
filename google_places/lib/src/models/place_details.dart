part of '../../google_places_sdk.dart';

/// Represents a particular physical place.
///
/// A Place encapsulates information about a physical location, including its name, address, and any other information we might have about it.

class PlaceDetails {
  final String? placeId;
  final String? name;
  final LatLngCoords? latLng;
  final String? address;
  final BusinessStatus? businessStatus;
  final bool? curbsidePickup;
  final bool? delivery;
  final bool? dineIn;
  final int? iconBackgroundColor;
  final String? iconURL;
  final OpeningHours? openingHours;
  final String? phoneNumber;
  final List<PhotoMetadata>? photoMetadatas;
  final PlusCode? plusCode;
  final PriceLevel? priceLevel;
  final double? rating;
  final List<PlaceType>? placeTypes;
  final int? userRatingTotal;
  final int? utcOffsetMinutes;
  final LatLngBounds? viewport;
  final Uri? websiteURI;
  final bool? isOpen;

  /// Represents a particular physical place.
  ///
  /// A Place encapsulates information about a physical location, including its name, address, and any other information we might have about it.
  ///
  /// For more information, visit [Place](https://developers.google.com/maps/documentation/places/android-sdk/reference/com/google/android/libraries/places/api/model/Place).
  const PlaceDetails({
    this.placeId,
    this.name,
    this.latLng,
    this.address,
    this.businessStatus,
    this.curbsidePickup,
    this.delivery,
    this.dineIn,
    this.iconBackgroundColor,
    this.iconURL,
    this.openingHours,
    this.phoneNumber,
    this.photoMetadatas,
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.placeTypes,
    this.userRatingTotal,
    this.utcOffsetMinutes,
    this.viewport,
    this.websiteURI,
    this.isOpen,
  });

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
  PlaceDetails copyWith({
    String? placeId,
    String? name,
    LatLngCoords? latLng,
    String? address,
    BusinessStatus? businessStatus,
    bool? curbsidePickup,
    bool? delivery,
    bool? dineIn,
    int? iconBackgroundColor,
    String? iconURL,
    OpeningHours? openingHours,
    String? phoneNumber,
    List<PhotoMetadata>? photoMetadatas,
    PlusCode? plusCode,
    PriceLevel? priceLevel,
    double? rating,
    List<PlaceType>? placeTypes,
    int? userRatingTotal,
    int? utcOffsetMinutes,
    LatLngBounds? viewport,
    Uri? websiteURI,
    bool? isOpen,
  }) {
    return _$PlaceDetailsCopyWith(
      this,
      placeId: placeId,
      name: name,
      latLng: latLng,
      address: address,
      businessStatus: businessStatus,
      curbsidePickup: curbsidePickup,
      delivery: delivery,
      dineIn: dineIn,
      iconBackgroundColor: iconBackgroundColor,
      iconURL: iconURL,
      openingHours: openingHours,
      phoneNumber: phoneNumber,
      photoMetadatas: photoMetadatas,
      plusCode: plusCode,
      priceLevel: priceLevel,
      rating: rating,
      placeTypes: placeTypes,
      userRatingTotal: userRatingTotal,
      utcOffsetMinutes: utcOffsetMinutes,
      viewport: viewport,
      websiteURI: websiteURI,
      isOpen: isOpen,
    );
  }

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$PlaceDetailsToJson(this);

  /// A constructor to parse a JSON ```Map```.
  factory PlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsFromJson(json);

  @override
  String toString() {
    return 'PlaceDetails('
        'placeId: $placeId, '
        'name: $name, '
        'latLng: $latLng, '
        'address: $address, '
        'businessStatus: $businessStatus, '
        'iconBackgroundColor: $iconBackgroundColor, '
        'iconURL: $iconURL, '
        'openingHours: $openingHours, '
        'phoneNumber: $phoneNumber, '
        'photoMetadatas: $photoMetadatas, '
        'plusCode: $plusCode, '
        'priceLevel: $priceLevel, '
        'rating: $rating, '
        'placeTypes: $placeTypes, '
        'userRatingTotal: $userRatingTotal, '
        'utcOffsetMinutes: $utcOffsetMinutes, '
        'viewport: $viewport, '
        'isOpen: $isOpen, '
        'curbsidePickup: $curbsidePickup, '
        'delivery: $delivery, '
        'dineIn: $dineIn, '
        'websiteURI: $websiteURI'
        ')';
  }
}

PlaceDetails _$PlaceDetailsCopyWith(
  PlaceDetails value, {
  Object? placeId = const _ArgNotPassed(),
  Object? name = const _ArgNotPassed(),
  Object? latLng = const _ArgNotPassed(),
  Object? address = const _ArgNotPassed(),
  Object? businessStatus = const _ArgNotPassed(),
  Object? curbsidePickup = const _ArgNotPassed(),
  Object? delivery = const _ArgNotPassed(),
  Object? dineIn = const _ArgNotPassed(),
  Object? iconBackgroundColor = const _ArgNotPassed(),
  Object? iconURL = const _ArgNotPassed(),
  Object? openingHours = const _ArgNotPassed(),
  Object? phoneNumber = const _ArgNotPassed(),
  Object? photoMetadatas = const _ArgNotPassed(),
  Object? plusCode = const _ArgNotPassed(),
  Object? priceLevel = const _ArgNotPassed(),
  Object? rating = const _ArgNotPassed(),
  Object? placeTypes = const _ArgNotPassed(),
  Object? userRatingTotal = const _ArgNotPassed(),
  Object? utcOffsetMinutes = const _ArgNotPassed(),
  Object? viewport = const _ArgNotPassed(),
  Object? websiteURI = const _ArgNotPassed(),
  Object? isOpen = const _ArgNotPassed(),
}) {
  return PlaceDetails(
    placeId: placeId is _ArgNotPassed ? value.placeId : placeId as String?,
    name: name is _ArgNotPassed ? value.name : name as String?,
    latLng: latLng is _ArgNotPassed ? value.latLng : latLng as LatLngCoords?,
    address: address is _ArgNotPassed ? value.address : address as String?,
    businessStatus: businessStatus is _ArgNotPassed
        ? value.businessStatus
        : businessStatus as BusinessStatus?,
    curbsidePickup: curbsidePickup is _ArgNotPassed
        ? value.curbsidePickup
        : curbsidePickup as bool?,
    delivery: delivery is _ArgNotPassed ? value.delivery : delivery as bool?,
    dineIn: dineIn is _ArgNotPassed ? value.dineIn : dineIn as bool?,
    iconBackgroundColor: iconBackgroundColor is _ArgNotPassed
        ? value.iconBackgroundColor
        : iconBackgroundColor as int?,
    iconURL: iconURL is _ArgNotPassed ? value.iconURL : iconURL as String?,
    openingHours: openingHours is _ArgNotPassed
        ? value.openingHours
        : openingHours as OpeningHours?,
    phoneNumber: phoneNumber is _ArgNotPassed
        ? value.phoneNumber
        : phoneNumber as String?,
    photoMetadatas: photoMetadatas is _ArgNotPassed
        ? value.photoMetadatas
        : photoMetadatas as List<PhotoMetadata>?,
    plusCode:
        plusCode is _ArgNotPassed ? value.plusCode : plusCode as PlusCode?,
    priceLevel: priceLevel is _ArgNotPassed
        ? value.priceLevel
        : priceLevel as PriceLevel?,
    rating: rating is _ArgNotPassed ? value.rating : rating as double?,
    placeTypes: placeTypes is _ArgNotPassed
        ? value.placeTypes
        : placeTypes as List<PlaceType>?,
    userRatingTotal: userRatingTotal is _ArgNotPassed
        ? value.userRatingTotal
        : userRatingTotal as int?,
    utcOffsetMinutes: utcOffsetMinutes is _ArgNotPassed
        ? value.utcOffsetMinutes
        : utcOffsetMinutes as int?,
    viewport:
        viewport is _ArgNotPassed ? value.viewport : viewport as LatLngBounds?,
    websiteURI:
        websiteURI is _ArgNotPassed ? value.websiteURI : websiteURI as Uri?,
    isOpen: isOpen is _ArgNotPassed ? value.isOpen : isOpen as bool?,
  );
}

Map<String, dynamic> _$PlaceDetailsToJson(PlaceDetails value) {
  return {
    'placeId': value.placeId,
    'name': value.name,
    'latLng': value.latLng?.toJson(),
    'address': value.address,
    'businessStatus': value.businessStatus == null
        ? null
        : _BusinessStatusConverter().toJson(value.businessStatus!),
    'iconBackgroundColor': value.iconBackgroundColor,
    'iconURL': value.iconURL,
    'openingHours': value.openingHours?.toJson(),
    'phoneNumber': value.phoneNumber,
    'photoMetadatas': value.photoMetadatas?.map((e) => e.toJson()).toList(),
    'plusCode': value.plusCode?.toJson(),
    'priceLevel': value.priceLevel == null
        ? null
        : _PriceLevelConverter().toJson(value.priceLevel!),
    'rating': value.rating,
    'placeTypes':
        value.placeTypes?.map((e) => _PlaceTypeConverter().toJson(e)).toList(),
    'userRatingTotal': value.userRatingTotal,
    'utcOffsetMinutes': value.utcOffsetMinutes,
    'viewport': value.viewport?.toJson(),
    'isOpen': value.isOpen,
    'curbsidePickup': value.curbsidePickup,
    'delivery': value.delivery,
    'dineIn': value.dineIn,
    'websiteURI': value.websiteURI?.toString(),
  }..removeWhere((key, value) => value == null);
}

PlaceDetails _$PlaceDetailsFromJson(Map<String, dynamic> json) {
  return PlaceDetails(
    placeId: json['placeId'],
    name: json['name'],
    latLng: json['latLng'] == null
        ? null
        : LatLngCoords.fromJson(Map<String, dynamic>.from(json['latLng'])),
    address: json['address'],
    businessStatus: json['businessStatus'] == null
        ? null
        : _BusinessStatusConverter().fromJson(json['businessStatus']),
    iconBackgroundColor: json['iconBackgroundColor'],
    iconURL: json['iconURL'],
    openingHours: json['openingHours'] == null
        ? null
        : OpeningHours.fromJson(
            Map<String, dynamic>.from(json['openingHours'])),
    phoneNumber: json['phoneNumber'],
    photoMetadatas: json['photoMetadatas'] == null
        ? null
        : List.from(json['photoMetadatas'])
            .map((e) => PhotoMetadata.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
    plusCode: json['plusCode'] == null
        ? null
        : PlusCode.fromJson(Map<String, dynamic>.from(json['plusCode'])),
    priceLevel: json['priceLevel'] == null
        ? null
        : _PriceLevelConverter().fromJson(json['priceLevel']),
    rating: json['rating'],
    placeTypes: json['placeTypes'] == null
        ? null
        : List<String>.from(json['placeTypes'])
            .map(_PlaceTypeConverter().fromJson)
            .toList(),
    userRatingTotal: json['userRatingTotal'],
    utcOffsetMinutes: json['utcOffsetMinutes'],
    viewport: json['viewport'] == null
        ? null
        : LatLngBounds.fromJson(Map<String, dynamic>.from(json['viewport'])),
    isOpen: json['isOpen'],
    curbsidePickup: json['curbsidePickup'],
    delivery: json['delivery'],
    dineIn: json['dineIn'],
    websiteURI:
        json['websiteURI'] == null ? null : Uri.tryParse(json['websiteURI']),
  );
}
