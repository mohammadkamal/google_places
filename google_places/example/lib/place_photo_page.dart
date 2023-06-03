import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_places/google_places.dart';

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
