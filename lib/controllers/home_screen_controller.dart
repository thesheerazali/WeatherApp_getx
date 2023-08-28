// import 'dart:convert';

// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:weather_app_getx/services/fetch_waether_api.dart';

// import '../constants/api_key.dart';
// import '../models/search_model.dart';

// import 'package:http/http.dart' as http;
// import 'package:geocoding/geocoding.dart';

// class HomeScreenController extends GetxController {
//   // Rx<WeatherModel> weather = WeatherModel.empty().obs;
//    var weather = Rx<WeatherModel?>(null);

//   final RxDouble _latitude = 0.0.obs;
//   final RxDouble _longitude = 0.0.obs;

//   RxString city = ''.obs;
//   RxString cityArea = ''.obs;

//   RxBool isLoding = true.obs;

//   RxBool checkLoading() => isLoding;

//   @override
//   void onInit() {
//     super.onInit();
//     if (isLoding.isTrue) {
//       _getUserLocation();
//     }
//   }

//   Future<void> fetchWeatherData() async {
//     final url =
//         "https://api.openweathermap.org/data/2.5/weather?lat=${_latitude}&lon=${_longitude}&appid=$apiKey&units=metric";

//     final response = await http.get(Uri.parse(url));
//     print(response.body);
//     print(_latitude);
//     print(_longitude);
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       var weatherData = WeatherModel.fromJson(data);
//       weather.value = weatherData;
//     } else {
//       print('Error fetching weather data');
//     }
//   }

//   Future<void> _getUserLocation() async {
//     bool isServeviceEnabled;
//     LocationPermission locationPermission;
//     isServeviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!isServeviceEnabled) {
//       return Future.error("Location service is not enabled");
//     }

//     locationPermission = await Geolocator.checkPermission();

//     if (locationPermission == LocationPermission.deniedForever) {
//       return Future.error("Location permission is denied Forever");
//     } else if (locationPermission == LocationPermission.denied) {
//       //request for permission
//       locationPermission = await Geolocator.requestPermission();
//       if (locationPermission == LocationPermission.denied) {
//         return Future.error("Location permission is denied");
//       }
//     }

//     return await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     ).then((value) {
//       _latitude.value = value.latitude;
//       _longitude.value = value.longitude;

//       // return WeatherService.fetchWeatherData(
//       //         latitude: _latitude.value,
//       //         longitude: _longitude.value,
//       //         weather:   weather.value)
//       //     .then((value) {
//       //   getUserAdress();
//       //   isLoding.value = false;
//       // });

//       return fetchWeatherData().then((value) {
//       getUserAdress();
//       isLoding.value = false;
//       });
//     });
//   }

  // getUserAdress() async {
  //   List<Placemark> placeMark =
  //       await placemarkFromCoordinates(_latitude.value, _longitude.value);
  //   print(placeMark);
  //   Placemark place = placeMark[0];
  //   city.value = place.locality!;
  //   cityArea.value = place.subLocality!;
  // }
// }


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
  RxString cityArea = ''.obs;
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
    cityArea.value = place.subLocality!;
  }

   
}
