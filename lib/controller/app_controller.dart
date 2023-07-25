import 'package:review_booking_web/controller/refresh_controller.dart';
import 'package:review_booking_web/controller/submitController.dart';
import 'package:get/get.dart';

typedef void MenuCallback(ObjectKey);
typedef void Callback();

class AppController extends GetxController {
  RefreshControllerStream refreshController = Get.put(RefreshControllerStream());
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  String errorLog = '';
  String token = '';
  String group = '';
  String role = '';
  String branch = '';
  String transaction = '';
  String user = '';
  String groupName = '';

  Future getLoginData() async {
    await initData();
  }

  Future initData() async {
    Future.wait([]);
  }
}

AppController appController = Get.put(AppController());
