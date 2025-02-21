import 'package:flutter/material.dart';
import 'package:travel_bee/providers/destination_provider.dart';
import 'package:travel_bee/services/live_location.dart';

import 'package:travel_bee/widgets/home/card_gallery.dart';
import 'package:travel_bee/widgets/layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  String _city = 'Lahore';

  getLocation() async {
    final currentCity = await getCurrentCity();
    setState(() {
      _city = currentCity;
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(destinationProvider);

    return data.when(
      data: (data) {
        final filteredData = data
          ..any((dest) {
            return dest.city.toLowerCase() == _city.toLowerCase().trim();
          });
        return Layout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocationWidget(),
              const SizedBox(
                height: 16,
              ),
              CardGallery(
                data: filteredData,
              ),
            ],
          ),
        );
      },
      error: (error, _) => Layout(
        child: Text('error1 $error'),
      ),
      loading: () => const Layout(
        child: Text('loading'),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getCurrentCity(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Fetching location...');
        } else if (snapshot.hasError) {
          return const Text('Error fetching location');
        } else {
          return Text(
            'Recommended Destinations Nearby (${snapshot.data})',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          );
        }
      },
    );
  }
}
