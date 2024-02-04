part of '../../google_places_sdk.dart';

@freezed
class AutocompletePrediction with _$AutocompletePrediction {
  const factory AutocompletePrediction({
    String? fullName,
    String? placeId,
    @_PlaceTypeConverter() @Default(<PlaceType>[]) List<PlaceType> placeTypes,
    String? primaryText,
    String? secondaryText,
  }) = _AutocompletePrediction;

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) =>
      _$AutocompletePredictionFromJson(json);
}
