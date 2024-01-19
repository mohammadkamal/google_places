# google_places

A flutter plugin for Google Places SDK with Android & iOS support.

|             | Android | iOS     |
|-------------|---------|---------|
| **Support** | SDK 16+ | iOS 11+ |

## Usage
To use this plugin please add ```google_places``` to your [pubspec.yaml](https://docs.flutter.dev/packages-and-plugins/using-packages) file.

### Initialize Plugin
First, you need to initialize the plugin.

```dart
await GooglePlaces().initialize(
  "Your maps key here",
  locale: const Locale('ar'),
);
```

There you go, you can now use the plugin.

### Change Locale
You can change your locale.

```dart
await GooglePlaces().updateLocale(const Locale('en'));
```

> Note that setting locale is only supported on Android. As iOS will use the device language.

### Get autocomplete results
After initializing the plugin, you can fetch auto complete search results from a query.

```dart
final List<AutocompletePrediction> results = await GooglePlaces().getAutoCompletePredictions('Great Pyramid of Giza');
```

Parameters:
| Parameter | Type | Condition |
| ----------- | ----------- | ----------- |
| query      | `String`       | **Required** |
| countryCodes   | `List<String>`        | *Optional* |
| locationBias   | `RectangularBounds`        | *Optional* |
| locationRestriction   | `RectangularBounds`        | *Optional* |
| placeTypes   | `List<PlaceType>`        | *Optional* |
| cancellationToken   | `CancellationToken`        | *Optional* |

### Get Place Details
You can get place details by passing the id to plugin.

```dart
final PlaceDetails placeDetails = await GooglePlaces.fetchPlaceDetails('Your Place Id');
```

Parameters:
| Parameter | Type | Condition |
| ----------- | ----------- | ----------- |
| placeId      | `String`       | **Required** |
| placeFields   | `List<PlaceField>`        | *Optional* |
| cancellationToken   | `CancellationToken`        | *Optional* |

### Get Place Photo
After fetching place details, you might need to fetch the place photo. Here's an example:

```dart
final Uint8List? photo = await GooglePlaces().fetchPlacePhoto(widget.metadata);
```

### Cancelling Requests
The plugin supports the cancellation of a requst to the Google API.

```dart
final token = CancellationToken();
final details = await GooglePlaces.fetchPlaceDetails('Your Place Id', cancellationToken: token);
await token.cancel();
```
> Note that issuing a cancellation token does NOT guarantee that a particular request will be cancelled, and you may still be charged for the request even if no response is returned.

> Note that this feature is supported only on Android.

## Feature Support
| Feature | Android | iOS |
| ----------- | ----------- | ----------- |
| Soft Localization      | ✅ | ❌ |
| Device Localizations | ✅ | ✅ |
| Place Autocomplete | ✅ | ✅ |
| Place Details | ✅ | ✅ |
| Current Place | ❌ | ❌ |
| Place Photo | ✅ | ✅ |
| Request Cancellation | ✅ | ❌ |

## Platform Support
| Platform | Version |
| ----------- | ----------- |
| Android      | SDK 16+ |
| iOS   | 11+ |
| Web   | Not yet supported |
| Linux | Not yet supported |
| MacOS | Not yet supported |
| Windows | Not yet supported |