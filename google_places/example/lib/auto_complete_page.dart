import 'package:flutter/material.dart';
import 'package:google_places/google_places.dart';

import 'place_details_page.dart';

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
