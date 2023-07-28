import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_button/like_button.dart';
import 'package:review_booking_web/controller/sound_controller.dart';
import 'package:review_booking_web/review_1200_screen.dart';
import 'package:review_booking_web/review_600_screen.dart';
import 'package:review_booking_web/review_desktop_screen.dart';
import 'package:review_booking_web/widget/basic_alert.dart';

import 'config/theme_config.dart';
import 'controller/app_controller.dart';
import 'controller/submitController.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        if (size.width < 1200 && size.width >= 600) {
          return Review1200Screen();
        } else if (size.width < 600) {
          return Review600Screen();
        } else {
          return ReviewDesktopScreen();
        }
      },
    );
  }
}
