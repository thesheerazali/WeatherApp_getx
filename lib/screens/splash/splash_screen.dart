import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:weather_app_getx/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Animation duration
    );

    _animation = Tween(begin: 0.0, end: 50.0).animate(_controller);

    // Start the animation after a delay
    Timer(Duration(seconds: 1), () {
      _controller.forward();
    });

    // Navigate to home screen after 5 seconds
    Timer(const Duration(seconds: 3), () {
      Get.off(HomeScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(147, 34, 237, 1),
            Color.fromRGBO(234, 156, 236, 1),
            Color.fromRGBO(231, 153, 181, 1),
            Color.fromRGBO(255, 234, 180, 1),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Weather \n App',
                style: GoogleFonts.ultra(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/icons/splashCloud.png',
                height: 300,
              ),
            ), // Replace with your image path
          ],
        ),
      ),
    );
  }
}
