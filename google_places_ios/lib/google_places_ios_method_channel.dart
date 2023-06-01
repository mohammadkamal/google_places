import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'google_places_ios_platform_interface.dart';

/// An implementation of [GooglePlacesIosPlatform] that uses method channels.
class MethodChannelGooglePlacesIos extends GooglePlacesIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('google_places_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
