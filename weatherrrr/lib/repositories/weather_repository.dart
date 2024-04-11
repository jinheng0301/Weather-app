// responsible for API call and organizing the data for controller.

import 'dart:convert' as convert;
import 'dart:developer';
import 'package:weatherrrr/data/location_data.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final apiKey = '5fdbc41030955bb80b154ab5f31dfeac';

  Future<LocationData?> getCurrentLocation() async {
    LocationData? locationData;
    final url = Uri.http('ip-api.com', '/json');
    final response = await http.get(url);

    // completed
    if (response.statusCode == 200) {
      final jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      locationData = LocationData.fromJson(jsonResponse);
      log('Request successful: $jsonResponse');
      return locationData;
    }
    // failed, status code isnt 200
    else {
      log('Request failed with status: ${response.statusCode}.');
      return locationData;
    }
  }
}
