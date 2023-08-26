import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:weather_app_getx/services/api_key.dart';

import '../models/search_model.dart';

import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class HomeScreenController extends GetxController {
  var weather = Rx<WeatherModel?>(null);

  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxString city = ''.obs;
  RxString cityArea = ''.obs;

  RxBool isLoding = true.obs;

  RxBool checkLoading() => isLoding;

  @override
  void onInit() {
    super.onInit();
    if (isLoding.isTrue) {
      _getUserLocation().then((_) {
        fetchWeatherData();
        getUserAdress();
      });
    }
  }

  Future<void> fetchWeatherData() async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${_latitude}&lon=${_longitude}&appid=$apiKey2&units=metric";

    final response = await http.get(Uri.parse(url));
    print(response.body);
    print(_latitude);
    print(_longitude);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var weatherData = WeatherModel.fromJson(data);
      weather.value = weatherData;
    } else {
      print('Error fetching weather data');
    }
  }

  Future<void> _getUserLocation() async {
    bool isServeviceEnabled;
    LocationPermission locationPermission;
    isServeviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServeviceEnabled) {
      return Future.error("Location service is not enabled");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is denied Forever");
    } else if (locationPermission == LocationPermission.denied) {
      //request for permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      isLoding.value = false;
    });
  }

  getUserAdress() async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(_latitude.value, _longitude.value);
    print(placeMark);
    Placemark place = placeMark[0];
    city.value = place.locality!;
    cityArea.value = place.subLocality!;
  }
}
