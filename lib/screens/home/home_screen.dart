import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app_getx/constants/routes.dart';
import 'package:weather_app_getx/controllers/home_screen_controller.dart';
import 'package:weather_app_getx/screens/search/search_screen.dart';

import 'Widgets/current_weather.dart';
import 'Widgets/header.dart';
import 'Widgets/weather_detail.dart';

class HomeScreen extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(147, 34, 237, 1),
              Color.fromRGBO(234, 156, 236, 1),
              Color.fromRGBO(231, 153, 181, 1),
              Color.fromRGBO(255, 234, 180, 1),
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Obx(
            () => controller.checkLoading().isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.08,
                        vertical: Get.height * 0.06),
                    child: Column(
                      //  scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        const Header(),
                        SizedBox(
                          height: Get.height * .05,
                        ),
                        CurrentWeather(),
                        SizedBox(
                          height: Get.height * .05,
                        ),
                        WeatherDetail(),
                        SizedBox(
                          height: Get.height * .035,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(),
                                )),
                            child: Container(
                              height: 50,
                              //width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text("Search another City",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ));
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