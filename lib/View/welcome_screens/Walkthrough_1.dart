import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Walkthrough1 extends StatelessWidget {
  const Walkthrough1({super.key});

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
                'assets/Slider_images/walkthrough1.png',
              ),
            ),
          ),
          const Gap(10),
          Text(
            'Book Your Charging Slot Now',
            style: GoogleFonts.overpass(
              textStyle: const TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(20),
          Text(
            'Go Green with EVLink',
            style: GoogleFonts.overpass(
              textStyle: const TextStyle(
                color: Color(0xFF03C988),
                letterSpacing: .5,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
