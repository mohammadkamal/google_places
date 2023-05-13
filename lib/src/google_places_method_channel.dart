part of google_places;

enum _Methods { initialize, updateLocale, autoComplete, placeDetails }

enum _Args {
  apiKey,
  query,
  countryCodes,
  placeId,
  placeFields,
  langCode,
  locationBias,
  locationRestriction,
  placeTypes
}

/// An implementation of [GooglePlacesPlatform] that uses method channels.
class MethodChannelGooglePlaces extends GooglePlacesPlatform {
  static const _methodChannelKey = 'google_places';

  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(_methodChannelKey);

  @override
  Future<void> initialize(String apiKey, {Locale? locale}) async {
    try {
      await methodChannel.invokeMethod(
          _Methods.initialize.name,
          {_Args.apiKey.name: apiKey, _Args.langCode.name: locale?.languageCode}
            ..removeWhere((key, value) => value == null));
    } on PlatformException catch (ex) {
      return Future.error(ex);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  @override
  Future<void> updateLocale(Locale locale) async {
    try {
      await methodChannel.invokeMethod(_Methods.updateLocale.name,
          {_Args.langCode.name: locale.languageCode});
    } on PlatformException catch (ex) {
      return Future.error(ex);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  @override
  Future<List<AutocompletePrediction>> getAutoCompletePredictions(
    String query, {
    List<String>? countryCodes,
    RectangularBounds? locationBias,
    RectangularBounds? locationRestriction,
    List<PlaceType>? placeTypes,
  }) async {
    try {
      final result = await methodChannel.invokeListMethod(
          _Methods.autoComplete.name,
          {
            _Args.query.name: query,
            _Args.countryCodes.name: countryCodes,
            _Args.locationBias.name: locationBias?.toJson(),
            _Args.locationRestriction.name: locationRestriction?.toJson(),
            _Args.placeTypes.name: placeTypes?.map((t) => t.value).toList(),
          }..removeWhere((key, value) => value == null));

      final temp = result?.map((e) => Map<String, dynamic>.from(e)).toList();

      return temp?.map(AutocompletePrediction.fromJson).toList() ?? [];
    } on PlatformException catch (ex) {
      return Future.error(ex);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  @override
  Future<PlaceDetails> fetchPlaceDetails(String placeId,
      {List<PlaceField>? placeFields}) async {
    try {
      final place = Map<String, dynamic>.from(await methodChannel.invokeMethod(
          _Methods.placeDetails.name,
          {
            _Args.placeId.name: placeId,
            _Args.placeFields.name: placeFields?.map((e) => e.value).toList()
          }..removeWhere((key, value) => value == null)));

      return PlaceDetails.fromJson(place);
    } on PlatformException catch (ex) {
      return Future.error(ex);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}
