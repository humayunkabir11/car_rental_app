import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forget_pssword_model/forget_password_model.dart';
import 'package:renti_user/view/screens/auth/otp/otp_model/otp_model.dart';
import 'package:renti_user/view/screens/auth/otp/otp_repo/otp_repo.dart';

class OtpController extends GetxController {

  OTPRepo otpRepo;
  OtpController({required this.otpRepo});

  bool isSubmit = false;
  bool signUp = true;
  bool isResend = false;

  OtpModel otpModel = OtpModel();

  TextEditingController otpController = TextEditingController();

  Future<void> verifyOtpResponse(String email, bool fromForgetScreen) async {
    isSubmit = true;
    update();

    ApiResponseModel responseModel = await otpRepo.verifyEmail(email: email, otpCode: otpController.text.trim());

    if (responseModel.statusCode == 200) {
      otpModel = OtpModel.fromJson(jsonDecode(responseModel.responseJson));

      fromForgetScreen ? Get.offAndToNamed(AppRoute.newPassword) : Get.offAndToNamed(AppRoute.signInScreen);
    } else {}

    isSubmit = false;
    update();
  }

  Future<void> resendOtpVerify() async{
    isResend = true;
    update();
    ApiResponseModel responseModel = await otpRepo.resendOtpVerifyResult();
    if (kDebugMode) {
      print("status code: ${responseModel.statusCode}");
    }
    if(responseModel.statusCode == 201){

      ForgetPasswordModel forgetPassModel = ForgetPasswordModel.fromJson(jsonDecode(responseModel.responseJson));
      AppUtils.successToastMessage("Successful".tr);
    }
    else{
      ForgetPasswordModel forgetPassModel = ForgetPasswordModel.fromJson(jsonDecode(responseModel.responseJson));
      AppUtils.successToastMessage(forgetPassModel.message.toString());
    }
    isResend = false;
    update();
  }
}
