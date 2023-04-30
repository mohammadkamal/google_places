part of google_places;

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

  PlaceDetails({
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
    return PlaceDetails(
      placeId: placeId ?? this.placeId,
      name: name ?? this.name,
      latLng: latLng ?? this.latLng,
      address: address ?? this.address,
      businessStatus: businessStatus ?? this.businessStatus,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      iconURL: iconURL ?? this.iconURL,
      openingHours: openingHours ?? this.openingHours,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoMetadatas: photoMetadatas ?? this.photoMetadatas,
      plusCode: plusCode ?? this.plusCode,
      priceLevel: priceLevel ?? this.priceLevel,
      rating: rating ?? this.rating,
      placeTypes: placeTypes ?? this.placeTypes,
      userRatingTotal: userRatingTotal ?? this.userRatingTotal,
      utcOffsetMinutes: utcOffsetMinutes ?? this.utcOffsetMinutes,
      viewport: viewport ?? this.viewport,
      isOpen: isOpen ?? this.isOpen,
      curbsidePickup: curbsidePickup ?? this.curbsidePickup,
      delivery: delivery ?? this.delivery,
      dineIn: dineIn ?? this.dineIn,
      websiteURI: websiteURI ?? this.websiteURI,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placeId': placeId,
      'name': name,
      'latLng': latLng?.toJson(),
      'address': address,
      'businessStatus': businessStatus?.value,
      'iconBackgroundColor': iconBackgroundColor,
      'iconURL': iconURL,
      'openingHours': openingHours?.toJson(),
      'phoneNumber': phoneNumber,
      'photoMetadatas': photoMetadatas?.map((e) => e.toJson()).toList(),
      'plusCode': plusCode?.toJson(),
      'priceLevel': priceLevel,
      'rating': rating,
      'placeTypes': placeTypes?.map((e) => e.value).toList(),
      'userRatingTotal': userRatingTotal,
      'utcOffsetMinutes': utcOffsetMinutes,
      'viewport': viewport?.toJson(),
      'isOpen': isOpen,
      'curbsidePickup': curbsidePickup,
      'delivery': delivery,
      'dineIn': dineIn,
      'websiteURI': websiteURI?.toString(),
    }..removeWhere((key, value) => value == null);
  }

  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    return PlaceDetails(
      placeId: json['placeId'],
      name: json['name'],
      latLng: json['latLng'] == null
          ? null
          : LatLngCoords.fromJson(Map<String, dynamic>.from(json['latLng'])),
      address: json['address'],
      businessStatus: json['businessStatus'] == null
          ? null
          : BusinessStatus.values
              .firstWhere((e) => e.value == json['businessStatus']),
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
          : PriceLevel.values.firstWhere((e) => e.id == json['priceLevel']),
      rating: json['rating'],
      placeTypes: json['placeTypes'] == null
          ? null
          : List<String>.from(json['placeTypes'])
              .map((t) => PlaceType.values.firstWhere((e) => e.value == t))
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

  @override
  String toString() {
    return '$PlaceDetails('
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
