import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  GoogleMapController? mapController;
  Rx<Position?> currentPosition = Rx<Position?>(null);
  TextEditingController locationController = TextEditingController();
  Rxn<String> errorMessage = Rxn<String>();
  RxBool isLoading = true.obs;
  LatLng? cameraPosition;

  @override
  void onInit() {
    super.onInit();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    try {
      isLoading.value = true;

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        errorMessage.value = 'Location services are disabled.';
        isLoading.value = false;
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          errorMessage.value = 'Location permission denied.';
          isLoading.value = false;
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        errorMessage.value =
            'Location permission permanently denied. Please enable it in app settings.';
        isLoading.value = false;
        return;
      }

      // Get the current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentPosition.value = position;
    } catch (e) {
      errorMessage.value = 'Failed to get location: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchLocation() async {
    String location = locationController.text.trim();
    if (location.isEmpty) {
      errorMessage.value = "Please enter a location";
      return;
    }

    try {
      List<Location> locations = await locationFromAddress(location);
      if (locations.isNotEmpty) {
        Location first = locations.first;
        cameraPosition = LatLng(first.latitude, first.longitude);
        mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: cameraPosition!, zoom: 14.0),
          ),
        );
      } else {
        errorMessage.value = "No locations found.";
      }
    } catch (e) {
      errorMessage.value = "Error searching location: $e";
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (currentPosition.value != null) {
      controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(
            currentPosition.value!.latitude,
            currentPosition.value!.longitude,
          ),
          14.0,
        ),
      );
    }
  }

  @override
  void onClose() {
    locationController.dispose();
    super.onClose();
  }
}
