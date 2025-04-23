import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.desktop,
    required this.mobile,
    this.largeMobile,
    this.tablet,
    this.webScreen,
  });

  final Widget desktop;
  final Widget mobile;
  final Widget? largeMobile;
  final Widget? tablet;
  final Widget? webScreen;

  // Check if the screen is mobile (width <= 500)
  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 500;
  }

  // Check if the screen is large mobile (width <= 700)
  static bool isLargeMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width <= 700;
  }

  // Check if the screen is tablet (width < 1024)
  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 1024;
  }

  // Check if the screen is desktop (width >= 1024)
  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 1024;
  }

  // Check if the screen is extra large (width > 1400)
  static bool isExtraLargeScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width > 1400;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // Debugging: Print screen width
    print("Screen Width: ${size.width}");

    // Return the appropriate widget based on screen width
    if (size.width > 1400 && webScreen != null) {
      return webScreen!;
    } else if (size.width >= 1024) {
      return desktop;
    } else if (size.width >= 700 && tablet != null) {
      return tablet!;
    } else if (size.width >= 500 && largeMobile != null) {
      return largeMobile!;
    } else {
      return mobile;
    }
  }
}