import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_places/google_places.dart';

import 'auto_complete_page.dart';

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
