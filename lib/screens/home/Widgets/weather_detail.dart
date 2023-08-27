import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/home_screen_controller.dart';

class WeatherDetail extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // Container background color with transparency
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.transparent.withOpacity(0.3))
            ],
          ),
          child: Obx(() {
            final weather = controller.weather;

            // Display weather data
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/icons/windspeed.png",
                  height: 50,
                ),
                Wrap(
                  children: [
                    Text(
                      '${weather.value?.wind.speed}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text('km/h',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            );
          }),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // Container background color with transparency
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.transparent.withOpacity(0.3))
            ],
          ),
          child: Obx(() {
            final weather = controller.weather;

            // Display weather data
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/icons/clouds.png",
                  height: 50,
                ),
                Wrap(
                  children: [
                    Text(
                      '${weather.value?.clouds.all}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text('%',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            );
          }),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // Container background color with transparency
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.transparent.withOpacity(0.3))
            ],
          ),
          child: Obx(() {
            final weather = controller.weather;

            // Display weather data
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/icons/humidity.png",
                  height: 50,
                ),
                Wrap(
                  children: [
                    Text(
                      '${weather.value?.main.humidity}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text('%',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
