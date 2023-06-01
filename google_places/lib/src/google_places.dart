part of google_places;

class GooglePlaces {
  Future<void> initialize(String apiKey, {Locale? locale}) async {
    return GooglePlacesPlatform.instance.initialize(apiKey, locale: locale);
  }

  Future<List<AutocompletePrediction>> getAutoCompletePredictions(String query,
      {List<String>? countryCodes}) async {
    return GooglePlacesPlatform.instance
        .getAutoCompletePredictions(query, countryCodes: countryCodes);
  }

  Future<PlaceDetails> fetchPlaceDetails(String placeId,
      {List<PlaceField>? placeFields}) async {
    return GooglePlacesPlatform.instance
        .fetchPlaceDetails(placeId, placeFields: placeFields);
  }
}
