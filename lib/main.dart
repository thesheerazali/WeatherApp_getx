import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_getx/constants/routes.dart';
import 'package:weather_app_getx/utils/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: homeScreen,
       theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
            useMaterial3: true,

          // Set your primary color here
            // hintColor: Color(0xfffe6d29), // You can also set the accent color
            // Add other theme settings here
          ),

       getPages: RouteGenerator.getPages(),
      
    );
  }
}