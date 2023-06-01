
import 'google_places_ios_platform_interface.dart';

class GooglePlacesIos {
  Future<String?> getPlatformVersion() {
    return GooglePlacesIosPlatform.instance.getPlatformVersion();
  }
}
