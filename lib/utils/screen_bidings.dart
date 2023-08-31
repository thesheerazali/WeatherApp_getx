import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/home_screen_controller.dart';


import '../controllers/search_screen_controller.dart';

class ScreenBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());

    Get.lazyPut(() => SearchScreenController());
    
  }
}
