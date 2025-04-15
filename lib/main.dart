import 'package:ev_link/Controllers/Location_controller.dart';
import 'package:ev_link/Controllers/Navigation_controller.dart';
import 'package:ev_link/View/Pages_screen/Booking_screen.dart';
import 'package:ev_link/View/Pages_screen/Home_page.dart';
import 'package:ev_link/View/Pages_screen/Profile_screen.dart';
import 'package:ev_link/View/Pages_screen/Service_screen.dart';
import 'package:ev_link/View/welcome_screens/Splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(LocationController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/booking', page: () => BookingScreen()),
        GetPage(name: '/service', page: () => ServiceScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
      ],
    );
  }
}
