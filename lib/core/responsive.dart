import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768;
  
  static bool isExtraSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < 380;
  
  static bool isLargeMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 430;
}