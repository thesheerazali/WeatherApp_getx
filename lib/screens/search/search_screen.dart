import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/constants/routes.dart';
import 'package:weather_app_getx/controllers/search_screen_controller.dart';
import 'package:weather_app_getx/screens/search/search_weather_detail_screen.dart';

class SearchScreen extends GetView<SearchScreenController> {
  TextEditingController textEAD = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
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
                horizontal: Get.width * .05, vertical: Get.height * .05),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.offNamed(homeScreen),
                      child: Container(
                        height: 50,
                        width: 50,
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
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .15,
                    ),
                    const Text(
                      "Search City",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: textEAD,
                  onChanged: (value) {
                    controller.searchText.value = value;
                    if (value.isEmpty) {
                      controller.weatherList.clear();
                    } else {
                      controller.fetchCityResults(value);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Search City",
                    hintStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors
                            .black, // You can adjust the color for the focused border
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .02,
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.searchText.value.isEmpty) {
                      return Text('Search any city weather...');
                    } else if (controller.weatherList.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (controller.cityNotFound.value) {
                      return Center(
                        child: Text('City not found'),
                      );
                    } else {
                      return ListView.separated(
                        itemCount: controller.weatherList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          // Create a space separator between items
                          return SizedBox(
                              height: Get.height *
                                  .008); // Adjust the height as needed
                        },
                        itemBuilder: (context, index) {
                          final weather = controller.weatherList[index];
                          return Container(
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
                            child: ListTile(
                                title: Text(
                                  'City: ${weather.name}, ${weather.sys!.country}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  'Temperature: ${weather.main.temp}°C',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: Image.asset(
                                  // "assets/weather/${weather.weather[0].icon}.png",
                                  weather.weather[0].path,
                                  height: Get.height * .07,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WeatherDetailScreen(weather: weather),
                                    ),
                                  );
                                  textEAD.clear();
                                }),
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
