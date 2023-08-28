import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/main.dart';

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
    Timer(Duration(seconds: 5), () {
      Get.off(() => MainScreen());
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => MainScreen(),
      //     ));
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
      backgroundColor: Color.fromARGB(255, 186, 204, 236).withOpacity(0.8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animation.value, 0),
                  child: child,
                );
              },
              child: Center(
                child: Image.asset('assets/icons/splashIcon.png', height: 100),
              ), // Replace with your image path
            ),
            SizedBox(height: 20),
            Text(
              'Weather App',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
