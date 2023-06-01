import 'dart:io';

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
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(),
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
                if (Platform.isIOS)
                  ElevatedButton(
                      onPressed: () async {
                        _googlePlacesPlugin
                            .getAutoCompletePredictions(_controller.text,
                                countryCodes: [
                              'SA'
                            ]).then((value) => setState(() {
                                  _predictions.clear();
                                  _predictions.addAll(value);
                                }));
                      },
                      child: const Text("Submit")),
                ..._predictions.map((e) => TextButton(
                      child: Text('$e'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PlaceDialog(
                                    placeId: e.placeId,
                                    plugin: _googlePlacesPlugin)));
                      },
                    ))
              ],
            ),
          ),
        );
      }),
    );
  }
}

class PlaceDialog extends StatefulWidget {
  final String placeId;
  final GooglePlaces plugin;

  const PlaceDialog({super.key, required this.placeId, required this.plugin});

  @override
  State<StatefulWidget> createState() => _PlaceDialogState();
}

class _PlaceDialogState extends State<PlaceDialog> {
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
    return Scaffold(appBar: AppBar(), body: Text('$details'));
  }
}
