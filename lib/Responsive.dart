import 'package:flutter/material.dart';

class Responsive {
  static isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 850;
  }

  static isTablet(BuildContext context) {
    return (1100 < MediaQuery.of(context).size.width) &&
        (MediaQuery.of(context).size.width <= 850);
  }

  static isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }
}
