import 'package:geolocator/geolocator.dart';

class LocationData {
  String? country;
  String? regionName;
  double? lat;
  double? lon;

  LocationData({
    this.country,
    this.regionName,
    this.lat,
    this.lon,
  });

  LocationData.fromJson(Map<String, dynamic> json) {
    country = json['country'] as String;
    regionName = json['regionName'] as String;
    lat = json['lat'] as double;
    lon = json['lon'] as double;
  }
  // the main purpose of json function is to transform Json data received from the HTTP request into a dart object
  // that can be utilized within our application.

  // Get the current location
  static Future<LocationData?> getCurrentLocation() async {
    try {
      // Request permission to access the device's location
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // If permission is denied, return null
        return null;
      } else {
        // Get the current position
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation);

        // Create a LocationData object with the obtained coordinates
        return LocationData(
          lat: position.latitude,
          lon: position.longitude,
        );
      }
    } catch (e) {
      // If an error occurs, return null
      print('Error getting location: $e');
      return null;
    }
  }
}
