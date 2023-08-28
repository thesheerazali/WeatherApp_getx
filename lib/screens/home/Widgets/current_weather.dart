import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/home_screen_controller.dart';

class CurrentWeather extends GetView<HomeScreenController> {
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
              color: const Color.fromARGB(255, 186, 204, 236).withOpacity(0.8))
        ],
      ),
      child: Obx(() {
        final weather = controller.weather;

        // Display weather data
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/weather/${weather.value?.weather[0].icon}.png",
            ),
            Row(
              children: [
                Text(
                  '${weather.value?.main.temp.round() ?? "20"}',
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
        );
      }),
    );
  }
}
