import 'package:get/get.dart';
import 'package:weatherrrr/data/location_data.dart';
import 'package:weatherrrr/repositories/weather_repository.dart';

class HomeController extends GetxController {
  final WeatherRepository _repository = Get.find();
  Rxn<LocationData> locationData = Rxn();
  // Rxn object is an observable

  String get address =>
      '${locationData.value?.regionName}, ${locationData.value?.country}';

  Future<void> getCurrentLocation() async {
    LocationData? location = await _repository.getCurrentLocation();

    print(location?.regionName);

    locationData.value = location;
  }

  getTemperatureForCurrentLocation() {}

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentLocation();
  }
}
