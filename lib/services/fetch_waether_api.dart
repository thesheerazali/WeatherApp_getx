

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_getx/constants/api_key.dart';

import '../models/search_model.dart';


class WeatherService {
  Future<WeatherModel> fetchWeatherData(double latitude, double longitude) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Error fetching weather data');
    }
  }
}

