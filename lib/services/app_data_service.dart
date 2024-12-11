import 'dart:ui';

import 'package:flutter/material.dart';

class AppData {
  AppData();


  static String getOnboardingHeading(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return "Let's Travel Together";
      case 1:
        return 'Plan Your Perfect Trip';
      case 2:
        return 'Connect with Fellow Travelers';
      case 3:
        return 'Travel Smart & Safe';
      default:
        return "Let's Travel Together";
    }
  }

  static String getOnboardingText(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 'Your perfect travel companion for unforgettable adventures and seamless journeys. Never explore alone again!';
      case 1:
        return 'Create detailed itineraries, discover hidden gems, and get personalized recommendations for your dream destination.';
      case 2:
        return 'Join a global community of explorers. Share experiences, tips, and make new friends along the way.';
      case 3:
        return 'Access real-time updates, emergency contacts, and local insights to ensure worry-free adventures anywhere in the world.';
      default:
        return 'Your perfect travel companion for unforgettable adventures and seamless journeys. Never explore alone again!';
    }
  }



  // Method to show the loading dialog
  static void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.6, sigmaY:2.6),
          child: Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.4,
                vertical: MediaQuery.of(context).size.height * 0.410),
            backgroundColor: Colors.transparent,
            child: const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    color: Colors.white,
                  ),
                )),
          ),
        );
      },
    );
  }


  // Method to hide the loading dialog
  static void hideLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop(); // Dismiss the dialog
  }


}
