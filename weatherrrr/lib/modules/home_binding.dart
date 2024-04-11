import 'package:get/get.dart';
import 'package:weatherrrr/modules/home_controller.dart';
import 'package:weatherrrr/repositories/weather_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherRepository());
    Get.lazyPut(() => HomeController());
    // Get.lazyPut is a function that generatees an object instance only when it's needed.
    // when we call a object hasnt been created yet a new one will be generated
    // if the object already exist, it will use the existing object.
  }
}
