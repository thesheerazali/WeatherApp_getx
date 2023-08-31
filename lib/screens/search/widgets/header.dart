import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../models/search_model.dart';

class DetailScreenHeader extends StatelessWidget {
  final WeatherModel weather;

  const DetailScreenHeader({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("yMMMMd").format(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "${weather.name}, ",
              style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              weather.sys!.country,
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
          ],
        ),
        Text(
          date,
          style: const TextStyle(
              fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
