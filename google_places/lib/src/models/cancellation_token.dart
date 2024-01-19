part of '../../google_places_sdk.dart';

class CancellationToken {
  final String? debugLabel;

  CancellationToken({this.debugLabel});

  Future<void> cancel() async {
    if (Platform.isIOS) {
      throw UnimplementedError("cancel() is not supported on iOS");
    }

    await GooglePlaces().cancelRequest(hashCode);
  }
}
