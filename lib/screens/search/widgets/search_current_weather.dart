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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/weather/${weather.weather[0].icon}.png",
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
                '${weather.main.temp.round()}',
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
          weather.weather[0].description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
