import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/home_screen_controller.dart';

class WeatherDetail extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: Get.width * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // Container background color with transparency
            boxShadow: [
              BoxShadow(
                  color:
                      const Color.fromARGB(255, 186, 204, 236).withOpacity(0.8))
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
                      '${weather.value?.wind.speed.round()}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    const Text('km/h',
                        style: TextStyle(
                            color: Colors.black54,
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
          width: Get.width * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // Container background color with transparency
            boxShadow: [
              BoxShadow(
                
                  
                  color:
                      const Color.fromARGB(255, 186, 204, 236).withOpacity(0.8))
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
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    const Text('%',
                        style: TextStyle(
                            color: Colors.black54,
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
          width: Get.width * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // Container background color with transparency
            boxShadow: [
              BoxShadow(
                  color:
                      const Color.fromARGB(255, 186, 204, 236).withOpacity(0.8))
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
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    const Text('%',
                        style: TextStyle(
                            color: Colors.black54,
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
