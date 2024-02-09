part of '../../google_places_sdk.dart';

class PhotoMetadata {
  final String? attributions;
  final int? width;
  final int? height;
  final String? ref;

  const PhotoMetadata({
    this.attributions,
    this.width,
    this.height,
    this.ref,
  });

  PhotoMetadata copyWith({
    String? attributions,
    int? width,
    int? height,
    String? ref,
  }) =>
      _$PhotoMetadataCopyWith(
        this,
        attributions: attributions,
        width: width,
        height: height,
        ref: ref,
      );

  Map<String, dynamic> toJson() => _$PhotoMetadataToJson(this);

  factory PhotoMetadata.fromJson(Map<String, dynamic> json) =>
      _$PhotoMetadataFromJson(json);

  @override
  String toString() =>
      'PhotoMetadata(attributions: $attributions, width: $width, height: $height, ref: $ref)';
}

PhotoMetadata _$PhotoMetadataCopyWith(
  PhotoMetadata value, {
  Object? attributions = const _ArgNotPassed(),
  Object? width = const _ArgNotPassed(),
  Object? height = const _ArgNotPassed(),
  Object? ref = const _ArgNotPassed(),
}) {
  return PhotoMetadata(
    attributions: attributions is _ArgNotPassed
        ? value.attributions
        : attributions as String?,
    width: width is _ArgNotPassed ? value.width : width as int?,
    height: height is _ArgNotPassed ? value.height : height as int?,
    ref: ref is _ArgNotPassed ? value.ref : ref as String?,
  );
}

Map<String, dynamic> _$PhotoMetadataToJson(PhotoMetadata value) {
  return {
    'attributions': value.attributions,
    'width': value.width,
    'height': value.height,
    'ref': value.ref,
  };
}

PhotoMetadata _$PhotoMetadataFromJson(Map<String, dynamic> json) {
  return PhotoMetadata(
    attributions: json['attributions'],
    width: json['width'],
    height: json['height'],
    ref: json['ref'],
  );
}
