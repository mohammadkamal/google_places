import 'package:flutter_test/flutter_test.dart';
import 'package:google_places_ios/google_places_ios.dart';
import 'package:google_places_ios/google_places_ios_platform_interface.dart';
import 'package:google_places_ios/google_places_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGooglePlacesIosPlatform
    with MockPlatformInterfaceMixin
    implements GooglePlacesIosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GooglePlacesIosPlatform initialPlatform = GooglePlacesIosPlatform.instance;

  test('$MethodChannelGooglePlacesIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGooglePlacesIos>());
  });

  test('getPlatformVersion', () async {
    GooglePlacesIos googlePlacesIosPlugin = GooglePlacesIos();
    MockGooglePlacesIosPlatform fakePlatform = MockGooglePlacesIosPlatform();
    GooglePlacesIosPlatform.instance = fakePlatform;

    expect(await googlePlacesIosPlugin.getPlatformVersion(), '42');
  });
}
