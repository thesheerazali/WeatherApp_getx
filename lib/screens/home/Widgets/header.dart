import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_getx/controllers/home_screen_controller.dart';

class Header extends GetView<HomeScreenController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("yMMMMd").format(DateTime.now());
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.city.value,
              style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            Row(
              children: [
                Text(
                  controller.cityArea?.value ?? controller.city.value,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      fontWeight: FontWeight.w900),
                ),
                const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 15,
                ),
              ],
            ),
            Text(
              date,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ));
  }
}
