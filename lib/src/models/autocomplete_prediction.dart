part of google_places;

class AutocompletePrediction {
  final String fullName;
  final String placeId;
  final List<PlaceType> placeTypes;
  final String primaryText;
  final String secondaryText;

  AutocompletePrediction({
    required this.fullName,
    required this.placeId,
    required this.placeTypes,
    required this.primaryText,
    required this.secondaryText,
  });

  AutocompletePrediction copyWith({
    String? fullName,
    String? placeId,
    List<PlaceType>? placeTypes,
    String? primaryText,
    String? secondaryText,
  }) {
    return AutocompletePrediction(
      fullName: fullName ?? this.fullName,
      placeId: placeId ?? this.placeId,
      placeTypes: placeTypes ?? this.placeTypes,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'placeId': placeId,
      'placeTypes': placeTypes.map((t) => t.value).toList(),
      'primaryText': primaryText,
      'secondaryText': secondaryText,
    };
  }

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutocompletePrediction(
      fullName: json['fullName'],
      placeId: json['placeId'],
      placeTypes: List<String>.from(json['placeTypes'])
          .map((t) => PlaceType.values.firstWhere((e) => e.value == t))
          .toList(),
      primaryText: json['primaryText'],
      secondaryText: json['secondaryText'],
    );
  }

  @override
  String toString() {
    return '$AutocompletePrediction('
        'fullName: $fullName, '
        'placeId: $placeId, '
        'placeTypes: $placeTypes, '
        'primaryText: $primaryText, '
        'secondaryText: $secondaryText)';
  }
}
