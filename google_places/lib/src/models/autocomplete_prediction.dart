part of '../../google_places_sdk.dart';

class _ArgNotPassed {
  const _ArgNotPassed();
}

/// A class represents the result of google auto complete prediction. Used in places search.
class AutocompletePrediction {
  final String? fullName;
  final String? placeId;
  final List<PlaceType> placeTypes;
  final String? primaryText;
  final String? secondaryText;

  /// Search result for the places search.
  ///
  /// Contains a name for the place [fullName] and an id [placeId].
  /// [placeId] can be used to fetch photos and [PlaceDetails].
  ///
  /// For more information, visits [AutocompletePrediction](https://developers.google.com/maps/documentation/places/android-sdk/reference/com/google/android/libraries/places/api/model/AutocompletePrediction)
  const AutocompletePrediction({
    this.fullName,
    this.placeId,
    this.placeTypes = const <PlaceType>[],
    this.primaryText,
    this.secondaryText,
  });

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
  AutocompletePrediction copyWith({
    String? fullName,
    String? placeId,
    List<PlaceType>? placeTypes,
    String? primaryText,
    String? secondaryText,
  }) =>
      _$AutocompletePredictionCopyWith(
        this,
        fullName: fullName,
        placeId: placeId,
        placeTypes: placeTypes,
        primaryText: primaryText,
        secondaryText: secondaryText,
      );

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$AutocompletePredictionToJson(this);

  /// A constructor to parse a JSON ```Map```.
  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) =>
      _$AutocompletePredictionFromJson(json);

  @override
  String toString() {
    return 'AutocompletePrediction('
        'fullName: $fullName, '
        'placeId: $placeId, '
        'placeTypes: $placeTypes, '
        'primaryText: $primaryText, '
        'secondaryText: $secondaryText'
        ')';
  }
}

AutocompletePrediction _$AutocompletePredictionCopyWith(
  AutocompletePrediction value, {
  Object? fullName = const _ArgNotPassed(),
  Object? placeId = const _ArgNotPassed(),
  Object? placeTypes = const _ArgNotPassed(),
  Object? primaryText = const _ArgNotPassed(),
  Object? secondaryText = const _ArgNotPassed(),
}) {
  return AutocompletePrediction(
    fullName: fullName is _ArgNotPassed ? value.fullName : fullName as String?,
    placeId: placeId is _ArgNotPassed ? value.placeId : placeId as String?,
    placeTypes: placeTypes is _ArgNotPassed
        ? value.placeTypes
        : placeTypes as List<PlaceType>,
    primaryText: primaryText is _ArgNotPassed
        ? value.primaryText
        : primaryText as String?,
    secondaryText: secondaryText is _ArgNotPassed
        ? value.secondaryText
        : secondaryText as String?,
  );
}

Map<String, dynamic> _$AutocompletePredictionToJson(
    AutocompletePrediction value) {
  return {
    'fullName': value.fullName,
    'placeId': value.placeId,
    'placeTypes': value.placeTypes.map(_PlaceTypeConverter().toJson).toList(),
    'primaryText': value.primaryText,
    'secondaryText': value.secondaryText,
  };
}

AutocompletePrediction _$AutocompletePredictionFromJson(
    Map<String, dynamic> json) {
  return AutocompletePrediction(
    fullName: json['fullName'],
    placeId: json['placeId'],
    placeTypes: json['placeTypes'] == null
        ? <PlaceType>[]
        : List<String>.from(json['placeTypes'])
            .map(_PlaceTypeConverter().fromJson)
            .toList(),
    primaryText: json['primaryText'],
    secondaryText: json['secondaryText'],
  );
}
