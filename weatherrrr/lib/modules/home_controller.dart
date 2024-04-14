import 'package:get/get.dart';
import 'package:weatherrrr/data/location_data.dart';
import 'package:weatherrrr/data/weather_data.dart';
import 'package:weatherrrr/repositories/weather_repository.dart';

class HomeController extends GetxController {
  final WeatherRepository _repository = Get.find();
  Rxn<LocationData> locationData = Rxn();
  // Rxn object is an observable
  Rxn<WeatherData> weatherData = Rxn();
  RxString infoText = '...'.obs;
  // infoText is a type of observable RX

  String get address =>
      '${locationData.value?.regionName}, ${locationData.value?.country}';
  // getter for address
  String get temperature => '${weatherData.value?.temp}';
  // another getter for temperature
  // to display important data from their respective objects

  Future<void> getCurrentLocation() async {
    LocationData? location = await _repository.getCurrentLocation();
    
    locationData.value = location;
  }

  Future<void> getTemperatureForCurrentLocation() async {
    if (locationData.value != null) {
      weatherData.value =
          await _repository.getWeatherForLocation(locationData.value!);
      _getInfoText(weatherData.value?.temp);
    }
  }

  void _getInfoText(int? temperature) {
    if (temperature == null) {
      infoText.value = "Unknown!";
    } else {
      if (temperature <= 0) {
        infoText.value =
            "Make sure to dress in warm clothes🧥!It's freezing out there!❄️";
      } else if (temperature <= 15) {
        infoText.value = "Put on a jacket so you don't get sick! 🧥🤧";
      } else {
        infoText.value = "Savor the weather, it's lovely! ☀️😊";
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getCurrentLocation();
    await getTemperatureForCurrentLocation();
  }
}
