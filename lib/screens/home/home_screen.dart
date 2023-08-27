import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/home_screen_controller.dart';

import 'Widgets/header.dart';

class HomeScreen extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back8.jpg'), fit: BoxFit.fill),
          ),
          child: Obx(
            () => controller.checkLoading().isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.08,
                        vertical: Get.height * 0.04),
                    scrollDirection: Axis.vertical,
                    children: [
                      Header(),
                      SizedBox(
                        height: 30,
                      ),
                      Obx(() {
                        final weather = controller.weather;

                        // Display weather data
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                                "assets/weather/${weather.value?.weather[0].icon}.png"),
                            Text(
                              '${weather.value?.main.temp.round() ?? "20"}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 120,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      })
                    ],
                  ),
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