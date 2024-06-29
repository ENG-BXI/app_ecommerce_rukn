
import 'package:flutter/material.dart';

double responsiveText({required BuildContext context,required double fontSize}) {
  double scaleFactor = ScaleFactor(context);
  double ResponsiveText = fontSize * scaleFactor;
  double lowerTextSize = fontSize * .8;
  double upperTextSize = fontSize * 1.2;
  debugPrint("scaleFactor = $scaleFactor ,ResponsiveText = $ResponsiveText , lowerTextSize = $lowerTextSize , upperTextSize = $upperTextSize ");
  return ResponsiveText.clamp(lowerTextSize, upperTextSize);
}

double ScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width > 1200) {
    return width / 1000;
  } else if (width < 900 && width > 600)
    return width / 700;
  else
    return width / 400;
}
