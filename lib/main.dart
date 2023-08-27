import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app_getx/constants/routes.dart';
import 'package:weather_app_getx/screens/home/home_screen.dart';
import 'package:weather_app_getx/screens/search_screen.dart';
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
      initialRoute: mainScreen,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      getPages: RouteGenerator.getPages(),
    );
  }
}

class MainScreenController extends GetxController {
  var tabIndex = 0.obs;
}

class MainScreen extends GetView<MainScreenController> {
  final List<Widget> screens = [HomeScreen(), SearchScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: screens,
          )),
      bottomNavigationBar: Obx(
        () => GNav(
          selectedIndex: controller.tabIndex.value,
          onTabChange: (index) {
            controller.tabIndex.value = index;
          },
          gap: 8,
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.blueAccent,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
          ],
          // Add margin to the bottom
        ),
      ),
    );
  }
}
