import 'package:flutter/material.dart';
import 'package:mams_city_guide/models/guided_tour.dart';
import 'package:mams_city_guide/widgets/custom_map.dart';

class GuidedTourScreen extends StatelessWidget {
  final GuidedTour guidedTour;
  const GuidedTourScreen({
    Key? key,
    required this.guidedTour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(guidedTour.name)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Description',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              guidedTour.description,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'What will you visit?',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: guidedTour.places
                  .map((place) => Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            place.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.cyan),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CustomMap(
                  locations: guidedTour.places
                      .map((place) => place.location)
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
