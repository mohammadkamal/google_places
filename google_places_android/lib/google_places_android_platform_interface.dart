import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'google_places_android_method_channel.dart';

abstract class GooglePlacesAndroidPlatform extends PlatformInterface {
  /// Constructs a GooglePlacesAndroidPlatform.
  GooglePlacesAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static GooglePlacesAndroidPlatform _instance = MethodChannelGooglePlacesAndroid();

  /// The default instance of [GooglePlacesAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelGooglePlacesAndroid].
  static GooglePlacesAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GooglePlacesAndroidPlatform] when
  /// they register themselves.
  static set instance(GooglePlacesAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
