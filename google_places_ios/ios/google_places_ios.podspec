#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint google_places_ios.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'google_places_ios'
  s.version          = '2.0.0'
  s.summary          = 'iOS Pod for Google Places'
  s.description      = <<-DESC
Pod project for Google Places SDK for iOS Plaftorm.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => ['i386', 'arm64']}
  s.swift_version = '5.0'

  # Dependencies
  s.dependency 'GooglePlaces', '~> 6.2.1'
  s.static_framework = true
end
