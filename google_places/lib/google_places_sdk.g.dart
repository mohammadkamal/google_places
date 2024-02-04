// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_places_sdk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AutocompletePredictionImpl _$$AutocompletePredictionImplFromJson(
        Map<String, dynamic> json) =>
    _$AutocompletePredictionImpl(
      fullName: json['fullName'] as String?,
      placeId: json['placeId'] as String?,
      placeTypes: (json['placeTypes'] as List<dynamic>?)
              ?.map((e) => const _PlaceTypeConverter().fromJson(e as String))
              .toList() ??
          const <PlaceType>[],
      primaryText: json['primaryText'] as String?,
      secondaryText: json['secondaryText'] as String?,
    );

Map<String, dynamic> _$$AutocompletePredictionImplToJson(
        _$AutocompletePredictionImpl instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'placeId': instance.placeId,
      'placeTypes':
          instance.placeTypes.map(const _PlaceTypeConverter().toJson).toList(),
      'primaryText': instance.primaryText,
      'secondaryText': instance.secondaryText,
    };
