part of google_places;

class GooglePlaces {
  Locale? _locale;
  late String _apiKey;
  bool isInitialized = false;

  Locale? get locale => _locale;
  String get apiKey => _apiKey;

  static final _singleton = GooglePlaces._();
  GooglePlaces._();
  factory GooglePlaces() => _singleton;

  Future<void> initialize(String apiKey, {Locale? locale}) async {
    try {
      _apiKey = apiKey;
      _locale = locale ?? _locale;
      isInitialized = true;
      return GooglePlacesPlatform.instance.initialize(apiKey, locale: locale);
    } catch (ex) {
      isInitialized = false;
      return Future.error(ex);
    }
  }

  Future<void> updateLocale(Locale locale) async {
    _locale = locale;
    return GooglePlacesPlatform.instance.updateLocale(locale);
  }

  Future<List<AutocompletePrediction>> getAutoCompletePredictions(
    String query, {
    List<String>? countryCodes,
    RectangularBounds? locationBias,
    RectangularBounds? locationRestriction,
    List<PlaceType>? placeTypes,
  }) async {
    return GooglePlacesPlatform.instance.getAutoCompletePredictions(
      query,
      countryCodes: countryCodes,
      locationBias: locationBias,
      locationRestriction: locationRestriction,
      placeTypes: placeTypes,
    );
  }

  Future<PlaceDetails> fetchPlaceDetails(String placeId,
      {List<PlaceField>? placeFields}) async {
    return GooglePlacesPlatform.instance
        .fetchPlaceDetails(placeId, placeFields: placeFields);
  }

  Future<Uint8List> fetchPlacePhoto(PhotoMetadata metadata,
      {int? maxWidth, int? maxHeight}) async {
    return GooglePlacesPlatform.instance
        .fetchPlacePhoto(metadata, maxWidth: maxWidth, maxHeight: maxHeight);
  }
}
