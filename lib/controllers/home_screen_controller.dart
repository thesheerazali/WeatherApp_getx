import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import 'package:weather_app_getx/services/location_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/search_model.dart';
import '../services/fetch_waether_api.dart';

class HomeScreenController extends GetxController {
  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = LocationService();

  Rx<WeatherModel> weather = WeatherModel.empty().obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  RxString city = ''.obs;
  RxString? cityArea = ''.obs;
  RxBool isLoding = true.obs;

  RxBool checkLoading() => isLoding;

  @override
  void onInit() async {
    super.onInit();
    // Listen for connectivity changesp
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        // User has internet connection; refresh weather data
        _getUserLocation().then((value) => fetchWeatherData());
      }
    });

    if (isLoding.isTrue) {
      await _checkInternetPermission();
    }
  }

  Future<void> _checkInternetPermission() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.dialog(AlertDialog(
        title: Text('No Internet Connection'),
        content: Text('Please check your internet connection and try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'No Internet Connection Found',
                'To enable internet, please open Wi-Fi or mobile data settings manually.',
                snackPosition: SnackPosition.BOTTOM,
              ); // Close the dialog
              // Load cached data
            },
            child: Text('OK'),
          ),
          TextButton(
            onPressed: () {
               Get.back();
              _openInternetSettings();
              // Provide instructions to open internet settings manually
              // Get.back(); // Close the dialog
              // Get.snackbar(
              //   'Open Setting',
              //   'To enable internet, please open Wi-Fi or mobile data settings manually.',
              //   snackPosition: SnackPosition.BOTTOM,
              // );
            },
            child: Text('Open Settings'),
          ),
        ],
      ));
    } else {
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

  void _openInternetSettings() async {
    // Use different URLs for iOS and Android
    final url = Platform.isIOS
        ? 'app-settings:'
        : 'package:com.android.settings/wireless';
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        // Handle error: Could not launch the URL

        Get.snackbar(
          'Open Setting',
          'Could not open internet settings',
          snackPosition: SnackPosition.BOTTOM,
        );
        print('Could not open internet settings');
      }
    } catch (e) {
      Get.snackbar(
        'Open Setting',
        'Error opening internet settings: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Handle exception, e.g., if the URL is not supported on the platform
      print('Error opening internet settings: $e');
    }
  }
}
