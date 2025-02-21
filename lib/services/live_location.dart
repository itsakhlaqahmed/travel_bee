import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
// imp

Future<String> getCurrentCity() async {
  try {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'Location services are disabled.';
    }

    // Check location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return 'Location permissions are denied.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return 'Location permissions are permanently denied.';
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    // Convert coordinates to city name
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      return placemarks.first.locality ?? 'Unknown City';
    } else {
      return 'City not found';
    }
  } catch (e) {
    return 'Error: $e';
  }
}
