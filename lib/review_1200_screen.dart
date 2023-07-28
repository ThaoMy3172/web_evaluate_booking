import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_button/like_button.dart';
import 'package:review_booking_web/controller/sound_controller.dart';
import 'package:review_booking_web/widget/basic_alert.dart';

import 'config/theme_config.dart';
import 'controller/app_controller.dart';
import 'controller/submitController.dart';

class Review1200Screen extends StatefulWidget {
  const Review1200Screen({Key? key}) : super(key: key);

  @override
  State<Review1200Screen> createState() => _Review1200ScreenState();
}

class _Review1200ScreenState extends State<Review1200Screen> {
  int currRating = 5;

  Widget _buildRatingStar(int index) {
    if (index < currRating) {
      return const Icon(Icons.star,
          color: ThemeConfig.yellowFadeColor, size: 110);
    }

    return const Icon(Icons.star,
        color: ThemeConfig.yellowFadeColor, size: 110);
  }

  Widget _buildStar() {
    SoundController _soundController = SoundController();
    final stars = List<Widget>.generate(
        5,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: _likeButton(index, _soundController, 90),
        ));

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: stars);
  }

  Widget _likeButton(int index, SoundController _soundController, size) {
    return LikeButton(
        onTap: (bool isLiked) async {
          setState(() {
            currRating = index + 1;
            _soundController.playStarSound();
          });
          return !isLiked;
        },
        size: size,
        bubblesColor: const BubblesColor(
          dotPrimaryColor: ThemeConfig.warningColor,
          dotSecondaryColor: Color(0xff0099cc),
        ),
        likeBuilder: (bool isLiked) {
          return _buildRatingStar(index);
        });
  }

  final _confettiController =
  ConfettiController(duration: const Duration(seconds: 5));
  bool isPlaying = false;
  String branchName = "Eximbank";
  String typeTransactionName = "Doanh nghiep";
  String welcomeTitle = "Kỷ niệm 30 năm thành lập";
  late Map data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _confettiController.addListener(() {
      setState(() {
        isPlaying =
            _confettiController.state == ConfettiControllerState.playing;
      });
    });

    //get id from url
    data = Get.parameters;
    //get html welcome title
    welcomeTitle = """
   <div>
     <h3 style="text-align: center;" >
        Chi nhánh ${branchName}
     </h3>
  </div> 
  <div>
   <h2 style="text-align: center;" >
      ${welcomeTitle}
    </h2>
  </div> 
   
    """;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Scaffold(
          body: Stack(children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/danhgia_bg.png"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //welcome title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth: 200,
                            maxWidth: Get.width * 0.7,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: _buildHtml(45, 25),
                          ),
                        ),
                      ],
                    ),
                    //review stars
                    _buildStar(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width * 0.6,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 30),
                      constraints:
                      const BoxConstraints(minWidth: 300, maxWidth: 500),
                      child: const Text(
                        'Hãy cho chúng tôi biết suy nghĩ của bạn về dịch vụ của chúng tôi',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildInput(size),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildButton(size),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Cám ơn vì đã sử dụng dịch vụ của chúng tôi',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: SizedBox(
                height: 40,
                child: Image.asset("assets/images/LogoEximbank.png"),
              ),
            ),
          ]),
        ),
        ConfettiWidget(
          confettiController: _confettiController,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          gravity: 0.2,
        )
      ],
    );
  }

  Html _buildHtml(h2Size, h3Size) {
    return Html(
      data: welcomeTitle,
      style: {
        'h2': Style(
          color: ThemeConfig.darkBlueColor,
          fontSize: FontSize(h2Size),
          fontWeight: FontWeight.w600,
        ),
        'h3': Style(
          color: ThemeConfig.darkBlueColor,
          fontSize: FontSize(h3Size),
          fontWeight: FontWeight.w500,
        ),
      },
    );
  }

  Widget _buildButton(Size size) {
    SubmitController _submitControler = Get.put(SubmitController());

    return InkWell(
      onTap: () {
        _submitControler.submit(data['id'], {
          "star": currRating.toString(),
          "review": _submitControler.reviewContent.text
        }).then((v) {
          if (v) {
            setState(() {
              if (isPlaying) {
                _confettiController.dispose();
              } else {
                _confettiController.play();
              }
              if (currRating <= 2) {
                BasicAlert.badAlert(context,
                    title: 'Cám ơn bạn đã đóng góp ý kiến',
                    onConfirmBtnTap: () {
                      appController.refreshController.reloadData(true);
                      Navigator.pop(context);
                    });
              } else {
                BasicAlert.successAlert(context,
                    title: 'Cám ơn bạn đã sử dụng dịch vụ',
                    onConfirmBtnTap: () {
                      appController.refreshController.reloadData(true);
                      Navigator.pop(context);
                    });
              }
              // BasicAlert.successAlert(context, title: 'Cám ơn bạn đã đánh giá');
            });
          } else {
            // empty id
            BasicAlert.errorAlert(context, title: 'Vui lòng nhập nội dung');
          }
        });
      },
      child: Container(
        constraints: const BoxConstraints(minWidth: 200, maxWidth: 500),
        width: size.width / 100 * 60,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: ThemeConfig.darkBlueColor,
        ),
        child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Gửi đánh giá',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
      ),
    );
  }

  Container _buildInput(Size size) {
    SubmitController _submitController = Get.put(SubmitController());

    return Container(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
      width: size.width / 100 * 60,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 0.2, color: ThemeConfig.greyColor),
      ),
      child: TextFormField(
        controller: _submitController.reviewContent,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: 'Bạn có nhận xét gì không?'),
      ),
    );
  }
}
