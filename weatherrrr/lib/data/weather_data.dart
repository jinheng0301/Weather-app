class WeatherData {
  int? temp;

  WeatherData({this.temp});

  WeatherData.fromJson(Map<String, dynamic> json) {
    // Ensure 'main' key and 'temp' key exist in the JSON response
    if (json.containsKey('main') && json['main'].containsKey('temp')) {
      // Retrieve temperature in Kelvin from JSON response
      final tempInCelsius = json['main']['temp'] as double;
      // Convert temperature from Kelvin to Celsius and round it to an integer
      temp = tempInCelsius.round();
    } else {
      // If temperature data is not available, set it to null
      temp = null;
    }
  }
}
