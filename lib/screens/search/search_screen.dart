import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/search_screen_controller.dart';
import 'package:weather_app_getx/screens/search/search_weather_detail_screen.dart';

class SearchScreen extends GetView<SearchScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                controller.searchText.value = value;
                if (value.isEmpty) {
                  controller.weatherList.clear();
                } else {
                  controller.fetchCityResults(value);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.searchText.value.isEmpty) {
                return Text('Search any city weather...');
              } else if (controller.weatherList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.weatherList.length,
                  itemBuilder: (context, index) {
                    final weather = controller.weatherList[index];
                    return ListTile(
                      title: Text(
                          'City: ${weather.name}, ${weather.sys!.country}'),
                      subtitle: Text('Temperature: ${weather.main.temp}°C'),
                      trailing: Text("humidity ${weather.main.humidity}"),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WeatherDetailScreen(weather: weather),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
