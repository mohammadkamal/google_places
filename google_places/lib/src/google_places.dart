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

  /// Initialize your plugin.
  ///
  /// You can pass [locale] to apply it to auto complete results and place details.
  /// Passing [locale] is supported on Android only.
  /// On iOS, result will return with the device's language.
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

  /// Update your locale.
  ///
  /// This feature is supported on Android only.
  Future<void> updateLocale(Locale locale) async {
    _locale = locale;
    return GooglePlacesPlatform.instance.updateLocale(locale);
  }

  /// Get auto complete predictions.
  ///
  /// You can restrict your auto complete predictions by passing the following parameters:
  ///
  /// [countryCodes] is a list of codes that follows ISO 3166-1 Alpha-2.
  /// For example: 'EG', 'SA', etc.
  ///
  /// You can pass [locationBias] as a refenece for your predictions.
  ///
  /// You can pass [locationRestriction] to restrict your predictions search.
  ///
  /// You can pass [placeTypes] to restrict the types returned by the function.
  Future<List<AutocompletePrediction>> getAutoCompletePredictions(
    String query, {
    List<String>? countryCodes,
    RectangularBounds? locationBias,
    RectangularBounds? locationRestriction,
    List<PlaceType>? placeTypes,
    CancellationToken? cancellationToken,
  }) async {
    return GooglePlacesPlatform.instance.getAutoCompletePredictions(
      query,
      countryCodes: countryCodes,
      locationBias: locationBias,
      locationRestriction: locationRestriction,
      placeTypes: placeTypes,
      cancellationToken: cancellationToken,
    );
  }

  /// Get the place details.
  ///
  /// Pass [placeFields] to restrict the fields returned in [PlaceDetails].
  /// You can pass [CancellationToken] to cancel request
  Future<PlaceDetails> fetchPlaceDetails(
    String placeId, {
    List<PlaceField>? placeFields,
    CancellationToken? cancellationToken,
  }) async {
    return GooglePlacesPlatform.instance.fetchPlaceDetails(placeId,
        placeFields: placeFields, cancellationToken: cancellationToken);
  }

  /// Get a photo by metadata.
  ///
  /// Pass [maxWidth] and [maxHeight] to control the resolution of the returned photo.
  /// You can pass [CancellationToken] to cancel request
  ///
  /// Returns [Uint8List] and can be used in [Image.memory].
  Future<Uint8List> fetchPlacePhoto(
    PhotoMetadata metadata, {
    int? maxWidth,
    int? maxHeight,
    CancellationToken? cancellationToken,
  }) async {
    return GooglePlacesPlatform.instance.fetchPlacePhoto(metadata,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        cancellationToken: cancellationToken);
  }

  /// Cancel
  Future<void> cancelRequest(int tokenCode) async {
    return GooglePlacesPlatform.instance.cancelRequest(tokenCode);
  }
}
