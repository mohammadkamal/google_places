part of '../../google_places_sdk.dart';

/// The metadata corresponding to a single photo associated with a place.
class PhotoMetadata {
  /// The attributions that must be shown to the user if this photo is displayed.
  final String? attributions;

  /// The maximum width in which this photo is available.
  final int? width;

  /// The maximum height in which this photo is available.
  final int? height;
  final String? ref;

  /// The metadata corresponding to a single photo associated with a place.
  ///
  /// Used to fetch photos from [PlaceDetails].
  ///
  /// For more information, visit [PhotoMetadata](https://developers.google.com/maps/documentation/places/android-sdk/reference/com/google/android/libraries/places/api/model/PhotoMetadata).
  const PhotoMetadata({
    this.attributions,
    this.width,
    this.height,
    this.ref,
  });

  /// A method to copy and replace attributes.
  ///
  /// If the parameter is not passed, it will stay the same.
  /// However if a ```null``` is passed, it will replace the old value.
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

  /// A method to convert the class to JSON based ```Map```.
  Map<String, dynamic> toJson() => _$PhotoMetadataToJson(this);

  /// A constructor to parse a JSON ```Map```.
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
