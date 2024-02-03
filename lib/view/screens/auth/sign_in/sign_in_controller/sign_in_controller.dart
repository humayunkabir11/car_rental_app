import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_model/sign_in_response_model.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_repo/sign_in_repo.dart';

class SignInController extends GetxController{

  SignInRepo signInRepo;
  SignInController({required this.signInRepo});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool remember = false;
  bool isSubmit = false;

  saveInfo({required signInResponseModel})async {

    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.userIdKey, signInResponseModel.user?.id.toString() ?? "");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.accessTokenKey, signInResponseModel.accessToken ?? "");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.accessTokenType, "Bearer");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.email, signInResponseModel.user?.email.toString() ?? "");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.phoneNumber, signInResponseModel.user?.phoneNumber.toString() ?? "");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.fullName, signInResponseModel.user?.fullName.toString() ?? "");
  }

  Future<void> signInUser() async{
    isSubmit = true;
    update();

    ApiResponseModel responseModel = await signInRepo.signInUser(email: emailController.text.toString(), password: passwordController.text.toString());

    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      SignInResponseModel signInResponseModel = SignInResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${signInResponseModel.user.toString()}");
      AppUtils.successToastMessage("Sign In Successfully".tr);
      //socketService.emit("join-room", {"uid": "123"});
      signInRepo.apiService.sharedPreferences.setString("room_id", "123");

      await gotoNextStep(signInResponseModel);
    }
    else{
      AppUtils.errorToastMessage("Authentication Failed");
    }
    isSubmit = false;
    update();
  }

  gotoNextStep(SignInResponseModel signInResponseModel) async{

    print("email verified: ${signInResponseModel.user?.emailVerified}");



    if(remember){
      await signInRepo.apiService.sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, true);
    }
    else{
      await signInRepo.apiService.sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
    }
    // if(signInResponseModel.user?.emailVerified == false){
    // Get.toNamed(AppRoute.otpScreen);
    // }
    // else{
    //   return ;
    // }



    // var token = await signInRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey);
    if(signInResponseModel.user == null){
      Get.toNamed(AppRoute.signInScreen);
    }
    else if(signInResponseModel.user?.emailVerified == false){
      Get.toNamed(AppRoute.otpScreen,arguments: [emailController.text,true]);
    }
    else{
      signInRepo.apiService.sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, true);

      saveInfo(signInResponseModel: signInResponseModel);
      Get.offAllNamed(AppRoute.homeScreen);
      clearData();
    }

    if(remember){
      changeRememberMe();
    }
  }

  changeRememberMe() {
    remember = !remember;
    update();
  }

  clearData() {
    remember = false;
    isSubmit = false;
    emailController.text = "";
    passwordController.text = "";
    update();
  }
}
