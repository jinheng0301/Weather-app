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
}
