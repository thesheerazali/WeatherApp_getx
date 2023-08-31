import 'package:get/get.dart';

import 'package:weather_app_getx/screens/search/search_screen.dart';
import 'package:weather_app_getx/screens/splash/splash_screen.dart';
import 'package:weather_app_getx/utils/screen_bidings.dart';

import '../screens/home/home_screen.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
       GetPage(
          name: '/splash', page: () => SplashScreen(), binding: ScreenBidings()),
    
      GetPage(
          name: '/home', page: () => HomeScreen(), binding: ScreenBidings()),
      GetPage(
          name: '/search', page: () => SearchScreen(), binding: ScreenBidings())
    ];
  }
}
