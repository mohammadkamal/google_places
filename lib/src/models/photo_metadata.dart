part of google_places;

class PhotoMetadata {
  final String attributions;
  final int width;
  final int height;

  PhotoMetadata({
    required this.attributions,
    required this.width,
    required this.height,
  });

  PhotoMetadata copyWith({String? attributions, int? width, int? height}) {
    return PhotoMetadata(
      attributions: attributions ?? this.attributions,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toJson() =>
      {'attributions': attributions, 'width': width, 'height': height};

  factory PhotoMetadata.fromJson(Map<String, dynamic> json) {
    return PhotoMetadata(
      attributions: json['attributions'],
      width: json['width'],
      height: json['height'],
    );
  }

  @override
  String toString() =>
      '$PhotoMetadata(attributions: $attributions, width: $width, height: $height)';
}
