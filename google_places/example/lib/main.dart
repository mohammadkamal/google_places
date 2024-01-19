import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_places/google_places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await GooglePlaces().initialize(
      const String.fromEnvironment("MAPS_KEY"),
      locale: const Locale('ar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: const _HomePageContents(),
      ),
    );
  }
}

class _HomePageContents extends StatelessWidget {
  const _HomePageContents();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AutocompletePage())),
              child: const Text('Autocomplete'))
        ],
      ),
    );
  }
}

class AutocompletePage extends StatefulWidget {
  const AutocompletePage({super.key});

  @override
  State<AutocompletePage> createState() => _AutocompletePageState();
}

class _AutocompletePageState extends State<AutocompletePage> {
  final _predictions = <AutocompletePrediction>[];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Plugin example app')),
            body: Center(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextField(
                      controller: _controller,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      onSubmitted: (val) async {
                        GooglePlaces().getAutoCompletePredictions(val,
                            countryCodes: ['SA']).then(
                          (value) => setState(() {
                            _predictions.clear();
                            _predictions.addAll(value);
                          }),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        GooglePlaces().getAutoCompletePredictions(
                            _controller.text,
                            countryCodes: [
                              'SA'
                            ],
                            placeTypes: [
                              PlaceType.restaurant
                            ]).then((value) => setState(() {
                              _predictions.clear();
                              _predictions.addAll(value);
                            }));
                      },
                      child: const Text("Submit")),
                  ..._predictions.map(
                    (e) => AutoCompleteTile(prediction: e),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AutoCompleteTile extends StatelessWidget {
  final AutocompletePrediction prediction;

  const AutoCompleteTile({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          const Text('Place ID'),
          TextButton(
              onPressed: () =>
                  navigateToPage(context, placeId: prediction.placeId),
              child: Text(prediction.placeId))
        ]),
        TableRow(
            children: [const Text('Full name'), Text(prediction.fullName)]),
        TableRow(children: [
          const Text('Primary text'),
          Text(prediction.primaryText)
        ]),
        TableRow(children: [
          const Text('Secondary text'),
          Text(prediction.secondaryText)
        ]),
        TableRow(children: [const Text('PlaceTypes'), Container()]),
        ...prediction.placeTypes
            .map((t) => TableRow(children: [Container(), Text(t.value)]))
            .toList()
      ],
    );
  }

  void navigateToPage(BuildContext context, {required String placeId}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => PlaceDetailsPage(placeId: placeId)));
  }
}

class PlaceDetailsPage extends StatefulWidget {
  final String placeId;

  const PlaceDetailsPage({super.key, required this.placeId});

  @override
  State<StatefulWidget> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  PlaceDetails? details;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    GooglePlaces()
        .fetchPlaceDetails(widget.placeId)
        .then((value) => setState(() => details = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(details?.name ?? '')),
      body: SingleChildScrollView(
        child: Table(
          children: [
            TableRow(children: [
              const Text('Place ID'),
              Text(details?.placeId ?? '')
            ]),
            TableRow(children: [const Text('Name'), Text(details?.name ?? '')]),
            TableRow(children: [
              const Text('Coords'),
              Text('(${details?.latLng?.lat}, ${details?.latLng?.lng})')
            ]),
            TableRow(children: [
              const Text('Address'),
              Text(details?.address ?? '')
            ]),
            TableRow(children: [
              const Text('Business Status'),
              Text(details?.businessStatus?.value ?? '')
            ]),
            TableRow(children: [
              const Text('Curbside Pickup'),
              Text(details?.curbsidePickup.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Delivery'),
              Text(details?.delivery.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Dine in'),
              Text(details?.dineIn.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Icon Background Color'),
              Text(details?.iconBackgroundColor.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Icon URL'),
              Text(details?.iconURL ?? '')
            ]),
            TableRow(children: [
              const Text('Opening Hours'),
              Text(details?.openingHours.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Phone Number'),
              Text(details?.phoneNumber ?? '')
            ]),
            TableRow(children: [const Text('Photos Metadata'), Container()]),
            ...details?.photoMetadatas
                    ?.map((m) => TableRow(children: [
                          Container(),
                          PhotoMetadataTile(metadata: m)
                        ]))
                    .toList() ??
                [],
            TableRow(children: [
              const Text('Plus Code'),
              Text(details?.plusCode.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Price Level'),
              Text(details?.priceLevel?.id.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Rating'),
              Text(details?.rating.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Place Types'),
              Text(details?.placeTypes.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('User Rating Total'),
              Text(details?.userRatingTotal.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('UTC Offset Minutes'),
              Text(details?.utcOffsetMinutes.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Viewport'),
              Text(details?.viewport.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Website URI'),
              Text(details?.websiteURI?.toString() ?? '')
            ]),
            TableRow(children: [
              const Text('Is Open'),
              Text(details?.isOpen.toString() ?? '')
            ]),
          ],
        ),
      ),
    );
  }
}

class PhotoMetadataTile extends StatelessWidget {
  final PhotoMetadata metadata;

  const PhotoMetadataTile({super.key, required this.metadata});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$metadata'),
        TextButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PlacePhotoPage(metadata: metadata))),
          child: const Text('Show photo'),
        )
      ],
    );
  }
}

class PlacePhotoPage extends StatefulWidget {
  final PhotoMetadata metadata;

  const PlacePhotoPage({super.key, required this.metadata});

  @override
  State<StatefulWidget> createState() => _PlacePhotoPageState();
}

class _PlacePhotoPageState extends State<PlacePhotoPage> {
  Uint8List? photo;

  @override
  void initState() {
    super.initState();
    GooglePlaces()
        .fetchPlacePhoto(widget.metadata)
        .then((value) => setState(() => photo = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo')),
      body: Center(
        child: photo == null ? const Text('No image yet') : Image.memory(photo!),
      ),
    );
  }
}
