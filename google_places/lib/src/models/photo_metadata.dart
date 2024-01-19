part of '../../google_places.dart';

class PhotoMetadata {
  final String attributions;
  final int width;
  final int height;
  final String? ref;

  PhotoMetadata({
    required this.attributions,
    required this.width,
    required this.height,
    required this.ref,
  });

  PhotoMetadata copyWith(
      {String? attributions, int? width, int? height, String? ref}) {
    return PhotoMetadata(
      attributions: attributions ?? this.attributions,
      width: width ?? this.width,
      height: height ?? this.height,
      ref: ref ?? this.ref,
    );
  }

  Map<String, dynamic> toJson() => {
        'attributions': attributions,
        'width': width,
        'height': height,
        'ref': ref,
      };

  factory PhotoMetadata.fromJson(Map<String, dynamic> json) {
    return PhotoMetadata(
      attributions: json['attributions'],
      width: json['width'],
      height: json['height'],
      ref: json['ref'],
    );
  }

  @override
  String toString() =>
      '$PhotoMetadata(attributions: $attributions, width: $width, height: $height, ref: $ref)';
}
