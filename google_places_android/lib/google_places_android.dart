
import 'google_places_android_platform_interface.dart';

class GooglePlacesAndroid {
  Future<String?> getPlatformVersion() {
    return GooglePlacesAndroidPlatform.instance.getPlatformVersion();
  }
}
