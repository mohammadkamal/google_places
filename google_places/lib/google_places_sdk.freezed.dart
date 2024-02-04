// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_places_sdk.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AutocompletePrediction _$AutocompletePredictionFromJson(
    Map<String, dynamic> json) {
  return _AutocompletePrediction.fromJson(json);
}

/// @nodoc
mixin _$AutocompletePrediction {
  String? get fullName => throw _privateConstructorUsedError;
  String? get placeId => throw _privateConstructorUsedError;
  @_PlaceTypeConverter()
  List<PlaceType> get placeTypes => throw _privateConstructorUsedError;
  String? get primaryText => throw _privateConstructorUsedError;
  String? get secondaryText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AutocompletePredictionCopyWith<AutocompletePrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompletePredictionCopyWith<$Res> {
  factory $AutocompletePredictionCopyWith(AutocompletePrediction value,
          $Res Function(AutocompletePrediction) then) =
      _$AutocompletePredictionCopyWithImpl<$Res, AutocompletePrediction>;
  @useResult
  $Res call(
      {String? fullName,
      String? placeId,
      @_PlaceTypeConverter() List<PlaceType> placeTypes,
      String? primaryText,
      String? secondaryText});
}

/// @nodoc
class _$AutocompletePredictionCopyWithImpl<$Res,
        $Val extends AutocompletePrediction>
    implements $AutocompletePredictionCopyWith<$Res> {
  _$AutocompletePredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? placeId = freezed,
    Object? placeTypes = null,
    Object? primaryText = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      placeTypes: null == placeTypes
          ? _value.placeTypes
          : placeTypes // ignore: cast_nullable_to_non_nullable
              as List<PlaceType>,
      primaryText: freezed == primaryText
          ? _value.primaryText
          : primaryText // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryText: freezed == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AutocompletePredictionImplCopyWith<$Res>
    implements $AutocompletePredictionCopyWith<$Res> {
  factory _$$AutocompletePredictionImplCopyWith(
          _$AutocompletePredictionImpl value,
          $Res Function(_$AutocompletePredictionImpl) then) =
      __$$AutocompletePredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? fullName,
      String? placeId,
      @_PlaceTypeConverter() List<PlaceType> placeTypes,
      String? primaryText,
      String? secondaryText});
}

/// @nodoc
class __$$AutocompletePredictionImplCopyWithImpl<$Res>
    extends _$AutocompletePredictionCopyWithImpl<$Res,
        _$AutocompletePredictionImpl>
    implements _$$AutocompletePredictionImplCopyWith<$Res> {
  __$$AutocompletePredictionImplCopyWithImpl(
      _$AutocompletePredictionImpl _value,
      $Res Function(_$AutocompletePredictionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? placeId = freezed,
    Object? placeTypes = null,
    Object? primaryText = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_$AutocompletePredictionImpl(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      placeTypes: null == placeTypes
          ? _value._placeTypes
          : placeTypes // ignore: cast_nullable_to_non_nullable
              as List<PlaceType>,
      primaryText: freezed == primaryText
          ? _value.primaryText
          : primaryText // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryText: freezed == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AutocompletePredictionImpl implements _AutocompletePrediction {
  const _$AutocompletePredictionImpl(
      {this.fullName,
      this.placeId,
      @_PlaceTypeConverter()
      final List<PlaceType> placeTypes = const <PlaceType>[],
      this.primaryText,
      this.secondaryText})
      : _placeTypes = placeTypes;

  factory _$AutocompletePredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AutocompletePredictionImplFromJson(json);

  @override
  final String? fullName;
  @override
  final String? placeId;
  final List<PlaceType> _placeTypes;
  @override
  @JsonKey()
  @_PlaceTypeConverter()
  List<PlaceType> get placeTypes {
    if (_placeTypes is EqualUnmodifiableListView) return _placeTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placeTypes);
  }

  @override
  final String? primaryText;
  @override
  final String? secondaryText;

  @override
  String toString() {
    return 'AutocompletePrediction(fullName: $fullName, placeId: $placeId, placeTypes: $placeTypes, primaryText: $primaryText, secondaryText: $secondaryText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompletePredictionImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            const DeepCollectionEquality()
                .equals(other._placeTypes, _placeTypes) &&
            (identical(other.primaryText, primaryText) ||
                other.primaryText == primaryText) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullName,
      placeId,
      const DeepCollectionEquality().hash(_placeTypes),
      primaryText,
      secondaryText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompletePredictionImplCopyWith<_$AutocompletePredictionImpl>
      get copyWith => __$$AutocompletePredictionImplCopyWithImpl<
          _$AutocompletePredictionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AutocompletePredictionImplToJson(
      this,
    );
  }
}

abstract class _AutocompletePrediction implements AutocompletePrediction {
  const factory _AutocompletePrediction(
      {final String? fullName,
      final String? placeId,
      @_PlaceTypeConverter() final List<PlaceType> placeTypes,
      final String? primaryText,
      final String? secondaryText}) = _$AutocompletePredictionImpl;

  factory _AutocompletePrediction.fromJson(Map<String, dynamic> json) =
      _$AutocompletePredictionImpl.fromJson;

  @override
  String? get fullName;
  @override
  String? get placeId;
  @override
  @_PlaceTypeConverter()
  List<PlaceType> get placeTypes;
  @override
  String? get primaryText;
  @override
  String? get secondaryText;
  @override
  @JsonKey(ignore: true)
  _$$AutocompletePredictionImplCopyWith<_$AutocompletePredictionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
