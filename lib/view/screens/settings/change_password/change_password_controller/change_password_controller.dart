import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/settings/change_password/change_password_model/change_password_model.dart';
import 'package:renti_user/view/screens/settings/change_password/change_password_repo/change_password_repo.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordRepo repo;
  ChangePasswordController({required this.repo});

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();



  bool isSubmit = false;

  Future<void> changePassword() async {
    isSubmit = true;
    update();

    ApiResponseModel responseModel = await repo.changePassword(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
        retypePassword: confirmPasswordController.text);

    if (responseModel.statusCode == 200) {
      ChangePasswordModel model = ChangePasswordModel.fromJson(jsonDecode(responseModel.responseJson));
      AppUtils.successToastMessage(model.message ?? "Change Password Successfully".tr);
      Get.toNamed(AppRoute.signInScreen);
    }

    else if (responseModel.statusCode == 402) {
      AppUtils.successToastMessage("current password doesn't match".tr);
    }

    clearData();
    isSubmit = false;
    update();
  }

  clearData() {
    isSubmit = false;
    newPasswordController.text = "";
    currentPasswordController.text = "";
    confirmPasswordController.text = "";
    update();
  }
}
