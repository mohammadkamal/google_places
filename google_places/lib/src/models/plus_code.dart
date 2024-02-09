part of '../../google_places_sdk.dart';

class PlusCode {
  final String? compoundCode;
  final String? globalCode;

  const PlusCode({this.compoundCode, this.globalCode});

  PlusCode copyWith() => _$PlusCodeCopyWith(this,
      compoundCode: compoundCode, globalCode: globalCode);

  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);

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
