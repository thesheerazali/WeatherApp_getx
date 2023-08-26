import 'package:flutter/material.dart';

import '../models/search_model.dart';
// Import the WeatherModel class

class WeatherDetailScreen extends StatelessWidget {
  final WeatherModel weather;

  WeatherDetailScreen({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('City: ${weather.name}, ${weather.sys!.country}'),
            Text('Temperature: ${weather.main.temp}°C'),
          ],
        ),
      ),
    );
  }
}
