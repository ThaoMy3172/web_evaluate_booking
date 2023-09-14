import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_config.dart';

class ThemeConfig {
  static const Color backgroundColor = Color(0xFF272944);
  static const Color primaryColor = Color(0xFF272944);
  // static const Color headerColor = Color(0xFF2b6eb8);
  static const Color secondColor = Color(0xFF363853);
  static const Color thirdColor = Color(0xFF404BDA);
  static const Color fourthColor = Color(0xFFF9F9FA);
  static const Color background2Color = Color(0xFFf0f0f0);
  static const Color background2 = Color(0xfff2f7f7);
  static const Color greenColor2 = Color(0xFF18bc9c);
  static const Color greenColor = Color(0xFF00a06f);
  static const Color blueColor = Color(0xFF016eff);
  static const Color greyColor = Color(0xFF444d5b);
  static const Color orangeColor = Color(0xFFff8d01);
  static const Color violetColor = Color(0xFFaa51e6);
  static const Color brownColor = Color(0xFF73461a);
  static const Color redColor = Color(0xFFff3c3c);
  static const Color redColor2 = Color(0xFFffecec);
  static const Color hoverTextColor = greenColor;
  static const Color whiteColor = Colors.white;
  static Color commonTextColor = const Color(0xFF043C63);
  static const Color moneyColor = Color(0xFF457B4C);
  static const Color coffeeColor = Color(0xFFB77A00);
  static const Color warningColor = Color(0xFFE76161);
  static const Color greyBlueColor = Color(0xFF8BACAA);
  static const Color yellowFadeColor = Color(0xFFFFCC40);
  static const Color darkGreyColor = Color(0xFF707070);
  static const Color darkBlueColor = Color(0xFF043C63);
  static const Color lightGreyColor = Color(0xFFEAEAEA);

  static Color whiteColorWidthOpacity = Colors.white.withOpacity(0.2);
  static const Color textColor = greyColor;
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 10);
  static const Color headerColor = Color(0xff2c3e4f);
  static double get headerSize => getSize(25);
  static double get headerLargeSize => getSize(30);
  static double get headerLargeMax => getSize(30);

  static double get borderRadius => getSize(10);
  static double get borderRadiusMax => getSize(50);

  static double get defaultSize => getSize(14);
  static double get defaultChipSize => getSize(30);
  static double get labelSize => getSize(12);
  static double get smallSize => getSize(13);
  static double get titleSize => getSize(20);
  static double get titleSize2 => getSize(18);
  static double get iconSize => getSize(30);
  static double get buttonSize => getSize(30);
  static String fontFamily = 'Roboto';
  static double defaultHorPadding = getSize(10);
  static double defaultPadding = getSize(20);
  static double defaultSizedBox = 20;
  static double defaultVerPadding = getSize(20);
  static double dialogSizeHeight = getSize(450);
  static double lineHigh = 1.5;
  static TextStyle defaultStyle = GoogleFonts.roboto(
      textStyle: TextStyle(fontSize: ThemeConfig.defaultSize, color: ThemeConfig.textColor, height: 1.5));
  static TextStyle defaultStyleWhite = GoogleFonts.roboto(
      textStyle: TextStyle(fontSize: ThemeConfig.defaultSize, color: ThemeConfig.whiteColor, height: 1.5));
  static TextStyle titleStyle = GoogleFonts.roboto(
      textStyle: TextStyle(fontSize: ThemeConfig.titleSize, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle titleStyle2 = GoogleFonts.roboto(
      textStyle: TextStyle(fontSize: ThemeConfig.titleSize2, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle headerStyle = GoogleFonts.roboto(
      textStyle: TextStyle(fontSize: ThemeConfig.headerSize, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle headerLargeStyle = GoogleFonts.roboto(
      textStyle: TextStyle(fontSize: ThemeConfig.headerLargeSize, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle headerLargeWhite = GoogleFonts.roboto(
      textStyle: TextStyle(fontSize: ThemeConfig.headerLargeSize, color: ThemeConfig.whiteColor, height: 1.5));

  static TextStyle smallStyle = GoogleFonts.roboto(
      textStyle: TextStyle(fontSize: ThemeConfig.smallSize, color: ThemeConfig.textColor, height: 1.5));

  static TextStyle labelStyle = GoogleFonts.roboto(
      textStyle: TextStyle(fontSize: ThemeConfig.labelSize, color: ThemeConfig.textColor, height: 1.5));

  static SizedBox spaceVertical() => SizedBox(
        height: defaultPadding / 2,
      );
  static SizedBox spaceHorizontal() => SizedBox(
        width: defaultPadding / 2,
      );

  static Color getStatusColor(int code) {
    switch (code) {
      case 0:
        return const Color(0xFFFCBDBD);
      case 1:
        return const Color(0xFFE3B7EB);
      case 2:
        return const Color(0xFFFFCD85);
      case 3:
        return const Color(0xFFFFF494);
      case 4:
        return const Color(0xFFC2DFFF);
      case 5:
        return const Color(0xFFD2F5B0);
      case 6:
        return const Color(0xFF86E3CE);
      case 7:
        return const Color(0xFFC9CCC4);
      default:
        return const Color(0xFF86E3CE);
    }
  }

  static List<Color> get listColor => <Color>[
        const Color(0xFF3a93ba), // 0
        const Color(0xFFFA897B),
        const Color(0xFF86E3CE), // 2
        const Color(0xFFD0E6A5),
        const Color(0xFFFFDD94), // 4
        const Color(0xFFFA897B),
        const Color(0xFFCCABD8), // 6
        const Color(0xFFFBC78D),
        const Color(0xFF16325C), // 8
        const Color(0xFF08A69E),
        const Color(0xFFE2CE7D), // 10
        const Color(0xFFFFB75d),
        const Color(0xFF00716b), // 12
        const Color(0xFF009e73),
        const Color(0xFF93c9f8), // 14
        const Color(0xFF3a93ba),
        const Color(0xFF00716b), // 16
      ];
}

double getSize(double size) {
  var shortestSide = Get.width > AppConfig.LARGE_SIZE ? AppConfig.LARGE_SIZE : Get.width;
  if (shortestSide > 600) {
    return size;
  } else {
    return size * (shortestSide / 600);
  }
}
