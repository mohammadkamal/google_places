part of google_places;

enum _Methods {
  initialize,
  updateLocale,
  autoComplete,
  placeDetails,
  placePhoto,
  cancelRequest
}

enum _Args {
  apiKey,
  query,
  countryCodes,
  placeId,
  placeFields,
  langCode,
  locationBias,
  locationRestriction,
  placeTypes,
  photoMetadata,
  maxWidth,
  maxHeight,
  cancelToken
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
    CancellationToken? cancellationToken,
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
            _Args.cancelToken.name: cancellationToken.hashCode,
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
      {List<PlaceField>? placeFields,
      CancellationToken? cancellationToken}) async {
    try {
      final place = Map<String, dynamic>.from(await methodChannel.invokeMethod(
          _Methods.placeDetails.name,
          {
            _Args.placeId.name: placeId,
            _Args.placeFields.name: placeFields?.map((e) => e.value).toList(),
            _Args.cancelToken.name: cancellationToken.hashCode,
          }..removeWhere((key, value) => value == null)));

      return PlaceDetails.fromJson(place);
    } on PlatformException catch (ex) {
      return Future.error(ex);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  @override
  Future<Uint8List> fetchPlacePhoto(
    PhotoMetadata metadata, {
    int? maxWidth,
    int? maxHeight,
    CancellationToken? cancellationToken,
  }) async {
    try {
      final photo = await methodChannel.invokeMethod<Uint8List>(
          _Methods.placePhoto.name,
          {
            _Args.photoMetadata.name: metadata.toJson(),
            _Args.maxWidth.name: maxWidth,
            _Args.maxHeight.name: maxHeight,
          }..removeWhere((key, value) => value == null));

      return photo!;
    } on PlatformException catch (ex) {
      return Future.error(ex);
    } catch (ex) {
      return Future.error(ex);
    }
  }

  @override
  Future<void> cancelRequest(int tokenCode) async {
    try {
      await methodChannel.invokeMethod(
          _Methods.cancelRequest.name, {_Args.cancelToken.name: tokenCode});
    } on PlatformException catch (ex) {
      return Future.error(ex);
    }
  }
}
