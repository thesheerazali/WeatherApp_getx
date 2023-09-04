import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationService {
  Future<Position> getUserLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      throw Exception("Location service is not enabled");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      
       Get.dialog(
        AlertDialog(
          title: Text('Location Permission Required'),
          content: Text('Please enable location permission to use the app.'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
                _openAppSettings(); // Open app settings
              },
              child: Text('Open Settings'),
            ),
          ],
        ),
      );

      // throw Exception("Location permission is denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
          Get.dialog(
        AlertDialog(
          title: Text('Location Permission Required'),
          content: Text('Please enable location permission to use the app.'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
                _openAppSettings(); // Open app settings
              },
              child: Text('Open Settings'),
            ),
          ],
        ),
      );
      }
    }

    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  
void _openAppSettings() async {
  await Geolocator.openAppSettings();
}
}
