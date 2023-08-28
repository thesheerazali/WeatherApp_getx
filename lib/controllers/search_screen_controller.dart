import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../constants/api_key.dart';
import '../models/search_model.dart';

class SearchScreenController extends GetxController {
  RxList<WeatherModel> weatherList = <WeatherModel>[].obs;
  RxString searchText = ''.obs;

   final RxBool cityNotFound = false.obs;

    void fetchCityResults(String cityName) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/find?q=$cityName&appid=$apiKey&units=metric'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> cityList = data['list'];
        weatherList.clear();

        for (final cityData in cityList) {
          final weather = WeatherModel.fromJson(cityData);
          weatherList.add(weather);
        }

        cityNotFound.value = false; // Reset cityNotFound when data is found
      } else {
        weatherList.clear();
        cityNotFound.value = true; // Set cityNotFound when no data is found
      }
    } catch (e) {
      print("Error: $e");
      weatherList.clear();
      cityNotFound.value = true; // Set cityNotFound on error as well
    }
  }
}
