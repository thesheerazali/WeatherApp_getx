import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:weather_app_getx/controllers/search_screen_controller.dart';
import 'package:weather_app_getx/screens/search/widgets/header.dart';
import 'package:weather_app_getx/screens/search/widgets/search_current_weather.dart';
import 'package:weather_app_getx/screens/search/widgets/search_detail_widget.dart';

import '../../models/search_model.dart';

class WeatherDetailScreen extends GetView<SearchScreenController> {
  final WeatherModel weather;

  const WeatherDetailScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
//      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(147, 34, 237, 1),
            Color.fromRGBO(234, 156, 236, 1),
            Color.fromRGBO(231, 153, 181, 1),
            Color.fromRGBO(255, 234, 180, 1),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.08, vertical: Get.height * 0.06),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .05,
              ),
              DetailScreenHeader(weather: weather),
              SizedBox(
                height: Get.height * .07,
              ),
              SearchCurrentDetail(weather: weather),
              SizedBox(
                height: Get.height * .07,
              ),
              SearchWeatherDetail(
                weather: weather,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// Container and Button Code//

// Container(
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(20)),
//                 height: 100,
//                 width: 250,
//                 child: Obx(() {
//                   final weather = controller.weather;

//                   if (weather.value == null) {
//                     // Display loading indicator
//                     return const Center(child: CircularProgressIndicator());
//                   } else {
//                     // Display weather data
//                     return Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'City: ${weather.value!.name}',
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             'Temperature: ${weather.value!.main.temp}°C',
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ]);
//                   }
//                 })),
//             ElevatedButton(
//               onPressed: () {
//                 Get.toNamed(searchScreen);
//               },
//               child: const Text(
//                 "Search Other City",
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//             )
