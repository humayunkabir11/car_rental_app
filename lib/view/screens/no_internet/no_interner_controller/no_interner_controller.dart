
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/route/app_route.dart';

class NoInternetController extends GetxController {
  final Connectivity _connectivity = Connectivity();

/*  void onConnectivityChange(ConnectivityResult result) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool(SharedPreferenceHelper.rememberMeKey);
    if (result == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: CustomText(text:
          "PLEASE CONNECT TO INTERNET".tr,fontSize: 16,fontWeight: FontWeight.w500),
          isDismissible: false,
          backgroundColor: AppColors.blackNormal,
          icon: const Icon(
            Icons.wifi_off_outlined,
            color: Colors.white,
            size: 35,
          ),
          snackStyle: SnackStyle.GROUNDED,
          duration:
           const Duration(seconds: 10));
             Get.offAllNamed(AppRoute.noInternet);

    } else {
      if (Get.isSnackbarOpen && repeat == false) {
        Get.closeAllSnackbars();
        Get.offAllNamed(AppRoute.signInScreen);
      }
      else if(Get.isSnackbarOpen && repeat == true){
        Get.closeAllSnackbars();
        Get.offAllNamed(AppRoute.homeScreen);
      }
    }
  }*/

  void onConnectivityChange(ConnectivityResult result) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool(SharedPreferenceHelper.rememberMeKey);
    if (result == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: CustomText(text: "PLEASE CONNECT TO INTERNET".tr,fontSize: 16,fontWeight: FontWeight.w500),
          isDismissible: false,
          backgroundColor: AppColors.blackNormal,
          icon: const Icon(
            Icons.wifi_off_outlined,
            color: Colors.white,
            size: 34,
          ),
          snackStyle: SnackStyle.GROUNDED,
          duration: const Duration(seconds: 10));
      Get.toNamed(AppRoute.noInternet);

    } else {
      if (Get.isSnackbarOpen && repeat == false) {
        Get.closeAllSnackbars();
        Get.offAllNamed(AppRoute.signInScreen);
      }
      else if(Get.isSnackbarOpen && repeat == true){
        Get.closeAllSnackbars();
        Get.back();
      }
    }
  }

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen((event) {
      onConnectivityChange(event);
    });
    super.onInit();
  }
}