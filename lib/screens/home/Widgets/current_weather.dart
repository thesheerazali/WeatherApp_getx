import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/home_screen_controller.dart';

class CurrentWeather extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Display weather data
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            // "assets/weather/${controller.weather.value.weather[0].icon}.png",
            controller.weather.value.weather[0].path,
            height: Get.height * .20,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            width: 150,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.height * .03),
            child: Row(
              // crossAxisAlignment: WrapCrossAlignment.values[0],
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${controller.weather.value.main.temp.round()}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Get.height * .08),
                  child: const Text(
                    "°C",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Text(
            controller.weather.value.weather[0].description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ],
      );
    });
  }
}
