import 'package:ev_link/View/welcome_screens/Onboard_screen.dart';
import 'package:ev_link/View/welcome_screens/Walkthrough_1.dart';
import 'package:ev_link/View/welcome_screens/Walkthrough_3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Walkthrough_2.dart';

class Sliderscreen extends StatefulWidget {
  const Sliderscreen({super.key});

  @override
  State<Sliderscreen> createState() => _SliderscreenState();
}

class _SliderscreenState extends State<Sliderscreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              Walkthrough1(),
              Walkthrough2(),
              Walkthrough3(),
            ],
          ),
          Positioned(
            bottom: screenHeight * 0.05,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text("Skip"),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xFF03C988),
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor:
                        3, // Controls the expansion of the active dot
                  ),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const OnboardScreen();
                            }),
                          );
                        },
                        child: Text(
                          "Done",
                          style: GoogleFonts.overpass(
                            textStyle: const TextStyle(
                              color: Color(0xFF03C988),
                              letterSpacing: .5,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          "Next",
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
          ),
        ],
      ),
    );
  }
}
