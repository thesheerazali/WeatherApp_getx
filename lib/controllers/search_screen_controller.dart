import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_getx/services/api_key.dart';
import 'dart:convert';

import '../models/search_model.dart';

class SearchScreenController extends GetxController {
  RxList<WeatherModel> weatherList = <WeatherModel>[].obs;
  var searchText = ''.obs;

  void fetchCityResults(String cityName) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/find?q=$cityName&appid=$apiKey2&units=metric'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> cityList = data['list'];
      weatherList.clear();

      for (final cityData in cityList) {
        final weather = WeatherModel.fromJson(cityData);
        weatherList.add(weather);
      }
    } else {
      // Clear the list when there's an error fetching data
      weatherList.clear();
    }
  }
}
