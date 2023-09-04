import 'dart:ui';

import 'package:flutter/material.dart';

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
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(147, 81, 148, 1),
                  Color.fromRGBO(91, 168, 209, 1),
                ],
                stops: [0.06, 0.83],
                begin: Alignment(1, 0),
                end: Alignment(0, 1),
              )),
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
                      '${weather.value.wind.speed.round()}',
                      style: const TextStyle(
                          color: Colors.white,
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
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(183, 72, 184, 1),
                  Color.fromRGBO(91, 168, 209, 1),
                ],
                stops: [0.06, 0.83],
                begin: Alignment(1, 0),
                end: Alignment(0, 1),
              )
              // Container background color with transparency

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
                      '${weather.value.clouds.all}',
                      style: const TextStyle(
                          color: Colors.white,
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
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(183, 72, 184, 1),
                  Color.fromRGBO(91, 168, 209, 1),
                ],
                stops: [0.06, 0.83],
                begin: Alignment(1, 0),
                end: Alignment(0, 1),
              )),
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
                      '${weather.value.main.humidity}',
                      style: const TextStyle(
                          color: Colors.white,
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
