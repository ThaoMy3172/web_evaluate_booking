import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_booking_web/model/index.dart';
import 'package:review_booking_web/review_1200_screen.dart';
import 'package:review_booking_web/review_600_screen.dart';
import 'package:review_booking_web/review_desktop_screen.dart';

import 'api/api.dart';
import 'config/theme_config.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  Map? param;
  String? id;
  Index index = Index();
  Future<bool> getData() async {
    param = Get.parameters;
    if(param != null && param!.containsKey('id')){
      id = param!['id'];
    }
    index = await api.checkReview(id??'');
    return index.isFinish ?? false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.hasData && snapshot.data!){
            return LayoutBuilder(
              builder: (context, constraints) {
                //638277742498089710
                Size size = MediaQuery.of(context).size;
                if (size.width < 1200 && size.width >= 600) {
                  return const Review1200Screen();
                } else if (size.width < 600) {
                  return const Review600Screen();
                } else {
                  return const ReviewDesktopScreen();
                }
              },
            );
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Số thứ tự của bạn',
                      style: ThemeConfig.headerStyle.copyWith(fontWeight: FontWeight.bold)),
                  Text(index.index??'',
                      style: ThemeConfig.headerLargeStyle.copyWith(
                          fontWeight: FontWeight.bold, color: ThemeConfig.commonTextColor, fontSize: 120)),
                  SizedBox(height: ThemeConfig.defaultHorPadding/2),
                  Text('Giao dịch tại quầy: ${index.transactions?.join(', ')}',
                      style: ThemeConfig.headerStyle.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: ThemeConfig.defaultHorPadding/2),
                  Text('Vui quay lại đây sau khi hoàn thành giao dịch, để đánh giá chất lượng dịch vụ nhé!',
                    style: GoogleFonts.b612(fontSize: ThemeConfig.headerLargeSize, color: ThemeConfig.commonTextColor),)
                ],
              ),
            );
          }
        },

      ),
    );
  }
}
