part of google_places;

class PlusCode {
  final String compoundCode;
  final String globalCode;

  PlusCode({required this.compoundCode, required this.globalCode});

  PlusCode copyWith({String? compoundCode, String? globalCode}) {
    return PlusCode(
      compoundCode: compoundCode ?? this.compoundCode,
      globalCode: globalCode ?? this.globalCode,
    );
  }

  Map<String, dynamic> toJson() =>
      {'compoundCode': compoundCode, 'globalCode': globalCode};

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
      compoundCode: json['compoundCode'], globalCode: json['globalCode']);

  @override
  String toString() =>
      '$PlusCode(compoundCode: $compoundCode, globalCode: $globalCode)';
}
