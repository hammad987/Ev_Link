import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Walkthrough2 extends StatelessWidget {
  const Walkthrough2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              image: AssetImage(
                'assets/Slider_images/walkthrough2.jpg',
              ),
            ),
          ),
          const Gap(30),
          Center(
            child: Text(
              'Smart Charging, Seamless',
              style: GoogleFonts.overpass(
                textStyle: const TextStyle(
                  color: Color(0xFF010C09),
                  letterSpacing: .5,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Maintenance ',
              style: GoogleFonts.overpass(
                textStyle: const TextStyle(
                  color: Color(0xFF010C09),
                  letterSpacing: .5,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Gap(30),
          Center(
            child: Text(
              'Effortlessly book EV charging slots,\n\t\t\tand access expert vehicle care.\n\t\t\tStay powered, stay worry-free!',
              style: GoogleFonts.overpass(
                textStyle: const TextStyle(
                  color: Color(0xFF03C988),
                  letterSpacing: .5,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
