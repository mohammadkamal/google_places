part of '../google_places_sdk.dart';

abstract class GooglePlacesPlatform extends PlatformInterface {
  /// Constructs a GooglePlacesPlatform.
  GooglePlacesPlatform() : super(token: _token);

  static final Object _token = Object();

  static GooglePlacesPlatform _instance = MethodChannelGooglePlaces();

  /// The default instance of [GooglePlacesPlatform] to use.
  ///
  /// Defaults to [MethodChannelGooglePlaces].
  static GooglePlacesPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GooglePlacesPlatform] when
  /// they register themselves.
  static set instance(GooglePlacesPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize(String apiKey, {Locale? locale}) async {
    throw UnimplementedError('initialize() has not been implemented');
  }

  Future<void> updateLocale(Locale locale) async {
    throw UnimplementedError('updateLocale() has not been implemented');
  }

  Future<List<AutocompletePrediction>> getAutoCompletePredictions(
    String query, {
    List<String>? countryCodes,
    RectangularBounds? locationBias,
    RectangularBounds? locationRestriction,
    List<PlaceType>? placeTypes,
    CancellationToken? cancellationToken,
  }) async {
    throw UnimplementedError(
        'getAutoCompletePredictions() has not been implemented');
  }

  Future<PlaceDetails> fetchPlaceDetails(
    String placeId, {
    List<PlaceField>? placeFields,
    CancellationToken? cancellationToken,
  }) async {
    throw UnimplementedError('fetchPlaceDetails() has not been implemented');
  }

  Future<Uint8List> fetchPlacePhoto(
    PhotoMetadata metadata, {
    int? maxWidth,
    int? maxHeight,
    CancellationToken? cancellationToken,
  }) async {
    throw UnimplementedError('fetchPlacePhoto() has not been implemented');
  }

  Future<void> cancelRequest(int tokenCode) {
    throw UnimplementedError('cancelRequest() has not been implemented');
  }
}
