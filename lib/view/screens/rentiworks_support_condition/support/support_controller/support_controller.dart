import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/support/suport_model/support_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/support/support_repo/support_repo.dart';

class SupportController extends GetxController {
  SupportRepo supportRepo;

  SupportController({required this.supportRepo});

  bool isLoading = false;
  String content = "";

  Future<void> loadData() async {
    isLoading = true;
    update();

    ApiResponseModel responseModel = await supportRepo.fetchData();
    if (responseModel.statusCode == 200) {
      SupportModel supportModel =
          SupportModel.fromJson(jsonDecode(responseModel.responseJson));
      content = supportModel.support?.content ?? "";
    }

    isLoading = false;
    update();
  }
}
