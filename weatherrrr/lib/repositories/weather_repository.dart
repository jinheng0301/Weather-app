// responsible for API call and organizing the data for controller.

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer';
import 'package:weatherrrr/data/location_data.dart';
import 'package:weatherrrr/data/weather_data.dart';

class WeatherRepository {
  final apiKey = '5fdbc41030955bb80b154ab5f31dfeac';

  Future<LocationData?> getCurrentLocation() async {
    LocationData? locationData;
    final url = Uri.http('ip-api.com', '/json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      locationData = LocationData.fromJson(jsonResponse);
      log('Request successful: $jsonResponse');
      return locationData;
    } else {
      log('Request failed with status: ${response.statusCode}.');
      return locationData;
    }
  }

  Future<WeatherData?> getWeatherForLocation(LocationData location) async {
    WeatherData? weather;

    final params = {
      'lat': location.lat.toString(),
      'lon': location.lon.toString(),
      'appid': apiKey,
      'units': 'metric',
      // specify units as metric to get temperature in Celsius
    };

    final url = Uri.http('api.openweathermap.org', '/data/2.5/weather', params);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      weather = WeatherData.fromJson(jsonResponse);
      log('Request successful: $jsonResponse');
      return weather;
    } else {
      log('Request failed with status: ${response.statusCode}.');
      return weather;
    }
  }
}
