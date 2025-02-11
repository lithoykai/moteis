import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static double width(double pixelWidth) {
    return pixelWidth * screenWidth / 375;
  }

  static double height(double pixelHeight) {
    return pixelHeight * screenHeight / 812;
  }

  static double fontSize(double pixelFontSize) {
    return pixelFontSize * (screenWidth / 375);
  }
}
