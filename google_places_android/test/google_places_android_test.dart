import 'package:flutter_test/flutter_test.dart';
import 'package:google_places_android/google_places_android.dart';
import 'package:google_places_android/google_places_android_platform_interface.dart';
import 'package:google_places_android/google_places_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGooglePlacesAndroidPlatform
    with MockPlatformInterfaceMixin
    implements GooglePlacesAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GooglePlacesAndroidPlatform initialPlatform = GooglePlacesAndroidPlatform.instance;

  test('$MethodChannelGooglePlacesAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGooglePlacesAndroid>());
  });

  test('getPlatformVersion', () async {
    GooglePlacesAndroid googlePlacesAndroidPlugin = GooglePlacesAndroid();
    MockGooglePlacesAndroidPlatform fakePlatform = MockGooglePlacesAndroidPlatform();
    GooglePlacesAndroidPlatform.instance = fakePlatform;

    expect(await googlePlacesAndroidPlugin.getPlatformVersion(), '42');
  });
}
