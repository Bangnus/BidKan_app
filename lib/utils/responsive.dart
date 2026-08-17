import 'package:flutter/material.dart';

class Responsive {
  static const double mobileBreakpoint = 768;
  static const double desktopBreakpoint = 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  static bool isWebOrDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint;
}
