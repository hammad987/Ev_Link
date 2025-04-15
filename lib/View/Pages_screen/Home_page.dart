import 'package:ev_link/Controllers/Location_controller.dart';
import 'package:ev_link/Models/StationModel.dart';
import 'package:ev_link/View/Pages_screen/Booking_screen.dart';
import 'package:ev_link/View/Pages_screen/Profile_screen.dart';
import 'package:ev_link/View/Pages_screen/Service_screen.dart';
import 'package:ev_link/Widgets/EVStationCard_screen.dart';
import 'package:ev_link/Widgets/EVStation_Detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocationController locationController = Get.put(LocationController());
  int _selectedIndex = 0;
  final List<StationModel> stationList = [
    StationModel(
      name: "EV Charging Station A",
      rating: 4.5,
      address: "12th Ave N, Birmingham",
      status: "Open 24 Hours",
      distance: "1 Km / 5 Min",
      power: "7 Kw/h",
      cost: "10 / KwH",
    ),
    StationModel(
      name: "EV Charging Station B",
      rating: 4.2,
      address: "5th St, New York",
      status: "Open 9 AM - 10 PM",
      distance: "2 Km / 7 Min",
      power: "6 Kw/h",
      cost: "9 / KwH",
    ),
    StationModel(
      name: "EV Charging Station C",
      rating: 4.7,
      address: "Main Rd, California",
      status: "Open 24 Hours",
      distance: "3 Km / 10 Min",
      power: "11 Kw/h",
      cost: "12 / KwH",
    ),
  ];
  void _handleBook(StationModel station) {
    print('Booking station: ${station.name}');
  }

  void _handleView(StationModel station) {
    print('Viewing station: ${station.name}');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EVStation_Detail(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (locationController.errorMessage.value != null) {
            return Center(
              child: Text(locationController.errorMessage.value!,
                  style: const TextStyle(color: Colors.red)),
            );
          }

          if (locationController.currentPosition.value == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final _tabs = [
            Stack(
              children: [
                SizedBox.expand(
                  child: GoogleMap(
                    onMapCreated: locationController.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        locationController.currentPosition.value!.latitude,
                        locationController.currentPosition.value!.longitude,
                      ),
                      zoom: 14.0,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                  ),
                ),
                // Search Bar
                Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: locationController.locationController,
                            decoration: const InputDecoration(
                              hintText: "Search EV location",
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                            onSubmitted: (_) =>
                                locationController.searchLocation(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF03C988),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.tune, color: Colors.white),
                          onPressed: () {
                            // Filter logic
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Station Cards
                Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 250,
                    child: PageView.builder(
                      itemCount: stationList.length,
                      controller: PageController(viewportFraction: 1.03),
                      itemBuilder: (context, index) {
                        final station = stationList[index];
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.01),
                            child: EVStationCard(
                              name: station.name,
                              rating: station.rating,
                              address: station.address,
                              status: station.status,
                              distance: station.distance,
                              power: station.power,
                              cost: station.cost,
                              onBook: () => _handleBook(station),
                              onView: () => _handleView(station),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            // Other tabs
            const BookingScreen(),
            const ServiceScreen(),
            const ProfileScreen(),
          ];

          return Stack(
            children: [
              _tabs[_selectedIndex],
              Positioned(
                bottom: 11,
                left: 0,
                right: 0,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: GNav(
                        gap: MediaQuery.of(context).size.width * 0.02,
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04,
                          vertical: 11,
                        ),
                        tabBackgroundColor: const Color(0xFF03C988),
                        selectedIndex: _selectedIndex,
                        onTabChange: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        activeColor: Colors.white,
                        color: Colors.grey,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                        ),
                        tabMargin: const EdgeInsets.symmetric(horizontal: 6),
                        tabs: [
                          GButton(
                            icon: Icons.circle,
                            iconColor: Colors.transparent,
                            text: 'Home',
                            leading: Image.asset(
                              'assets/Navigationbar_Images/Home.png',
                              height: MediaQuery.of(context).size.width * 0.06,
                              width: MediaQuery.of(context).size.width * 0.06,
                              color: _selectedIndex == 0
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          GButton(
                            icon: Icons.circle,
                            iconColor: Colors.transparent,
                            text: 'Booking',
                            leading: Image.asset(
                              'assets/Navigationbar_Images/Booking.png',
                              height: MediaQuery.of(context).size.width * 0.06,
                              width: MediaQuery.of(context).size.width * 0.06,
                              color: _selectedIndex == 1
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          GButton(
                            icon: Icons.circle,
                            iconColor: Colors.transparent,
                            text: 'Service',
                            leading: Image.asset(
                              'assets/Navigationbar_Images/maintenance.png',
                              height: 30,
                              width: 30,
                            ),
                          ),
                          GButton(
                            icon: Icons.circle,
                            iconColor: Colors.transparent,
                            text: 'Profile',
                            leading: Image.asset(
                              'assets/Navigationbar_Images/Profile.png',
                              height: MediaQuery.of(context).size.width * 0.06,
                              width: MediaQuery.of(context).size.width * 0.06,
                              color: _selectedIndex == 3
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
