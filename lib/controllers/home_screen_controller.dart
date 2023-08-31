

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import 'package:weather_app_getx/services/location_service.dart';

import '../models/search_model.dart';
import '../services/fetch_waether_api.dart';


class HomeScreenController extends GetxController {
  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = LocationService();

   Rx<WeatherModel?> weather = WeatherModel.empty().obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  RxString city = ''.obs;
  RxString? cityArea = ''.obs;
  RxBool isLoding = true.obs;

  RxBool checkLoading() => isLoding;

  @override
  void onInit() {
    super.onInit();
    if (isLoding.isTrue) {
      _getUserLocation();
    }
  }

  Future<void> _getUserLocation() async {
    try {
      final position = await _locationService.getUserLocation();
      _latitude.value = position.latitude;
      _longitude.value = position.longitude;

      await fetchWeatherData();
      getUserAdress();
      isLoding.value = false;
    } catch (e) {
      print("Error: $e");
      isLoding.value = false;
      // Handle the error gracefully, show a message, etc.
    }
  }

  Future<void> fetchWeatherData() async {
    try {
      final weatherData = await _weatherService.fetchWeatherData(
        _latitude.value,
        _longitude.value,
      );
      weather.value = weatherData;
    } catch (e) {
      print("Error: $e");
      // Handle the error gracefully, show a message, etc.
    }
  }
  

   getUserAdress() async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(_latitude.value, _longitude.value);
    print(placeMark);
    Placemark place = placeMark[0];
    city.value = place.locality!;
    cityArea!.value = place.subLocality!;
  }

   
}
