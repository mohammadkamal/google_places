part of '../../google_places_sdk.dart';

/// Plus Code, or Open Location Code (OLC), is a geocode system for identifying any geographical area on Earth, even when a street address does not exist.
class PlusCode {
  final String? compoundCode;
  final String? globalCode;

  /// Plus Code, or Open Location Code (OLC), is a geocode system for identifying any geographical area on Earth, even when a street address does not exist.
  ///
  /// For more information, visit [PlusCode](https://developers.google.com/maps/documentation/places/android-sdk/reference/com/google/android/libraries/places/api/model/PlusCode).
  const PlusCode({this.compoundCode, this.globalCode});

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
  PlusCode copyWith() => _$PlusCodeCopyWith(this,
      compoundCode: compoundCode, globalCode: globalCode);

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);

  /// A constructor to parse a JSON ```Map```.
  factory PlusCode.fromJson(Map<String, dynamic> json) =>
      _$PlusCodeFromJson(json);

  @override
  String toString() =>
      'PlusCode(compoundCode: $compoundCode, globalCode: $globalCode)';
}

PlusCode _$PlusCodeCopyWith(
  PlusCode value, {
  Object? compoundCode = const _ArgNotPassed(),
  Object? globalCode = const _ArgNotPassed(),
}) {
  return PlusCode(
    compoundCode: compoundCode is _ArgNotPassed
        ? value.compoundCode
        : compoundCode as String?,
    globalCode:
        globalCode is _ArgNotPassed ? value.globalCode : globalCode as String?,
  );
}

Map<String, dynamic> _$PlusCodeToJson(PlusCode value) {
  return {'compoundCode': value.compoundCode, 'globalCode': value.compoundCode};
}

PlusCode _$PlusCodeFromJson(Map<String, dynamic> json) {
  return PlusCode(
      compoundCode: json['compoundCode'], globalCode: json['globalCode']);
}
