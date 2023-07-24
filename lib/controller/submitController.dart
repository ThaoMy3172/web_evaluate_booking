import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api/api.dart';

class SubmitController extends GetxController {
  TextEditingController reviewContent = TextEditingController();

  Future submit(id, data) async {
    var result = await api.createReview(id, data);
    return result;
  }
}