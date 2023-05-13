import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

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
  final _googlePlacesPlugin = GooglePlaces();
  final _predictions = <AutocompletePrediction>[];
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await _googlePlacesPlugin.initialize(
        const String.fromEnvironment("MAPS_KEY"),
        locale: const Locale('fr'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Plugin example app')),
            body: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextField(
                      controller: _controller,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      onSubmitted: (val) async {
                        _googlePlacesPlugin
                            .getAutoCompletePredictions(val, countryCodes: [
                          'SA'
                        ]).then((value) => setState(() {
                                  _predictions.clear();
                                  _predictions.addAll(value);
                                }));
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        _googlePlacesPlugin.getAutoCompletePredictions(
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
                  ..._predictions.map((e) => TextButton(
                        child: Text('$e'),
                        onPressed: () {
                          navigateToPage(context,
                              placeId: e.placeId, plugin: _googlePlacesPlugin);
                        },
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void navigateToPage(BuildContext context,
      {required String placeId, required GooglePlaces plugin}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            PlaceDetailsPage(placeId: placeId, plugin: _googlePlacesPlugin),
      ),
    );
  }
}

class PlaceDetailsPage extends StatefulWidget {
  final String placeId;
  final GooglePlaces plugin;

  const PlaceDetailsPage(
      {super.key, required this.placeId, required this.plugin});

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

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    widget.plugin
        .fetchPlaceDetails(widget.placeId)
        .then((value) => setState(() {
              details = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    log('$details');
    return Scaffold(appBar: AppBar(), body: Text('$details'));
  }
}
