import 'package:flutter/material.dart';
import 'package:google_places/google_places.dart';

import 'place_photo_page.dart';

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
