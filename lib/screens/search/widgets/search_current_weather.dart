import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/home_screen_controller.dart';
import 'package:weather_app_getx/models/search_model.dart';

class SearchCurrentDetail extends StatelessWidget {
  final WeatherModel weather;

  const SearchCurrentDetail({super.key, required this.weather});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // Container background color with transparency
          boxShadow: [
            BoxShadow(
                // blurRadius: 3,
                color:
                    const Color.fromARGB(255, 186, 204, 236).withOpacity(0.8))
          ],
        ),

        // Display weather data
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/weather/${weather.weather[0].icon}.png",
            ),
            Row(
              children: [
                Text(
                  '${weather.main.temp.round()}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 100,
                      fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Text(
                    "°",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
