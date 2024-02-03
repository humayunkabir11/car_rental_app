import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/sign_up/inner_widgets/sign_up_section.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_repo/sign_up_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_back_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(SignUpRepo(apiService: Get.find()));
    Get.put(SignUpController(signUpRepo: Get.find()));

    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.authUtils();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primaryColor,
        appBar:  CustomAppBar(
          appBarContent: CustomBack(
            text: AppStrings.signUp.tr,
          ),
        ),
        body: GetBuilder<SignUpController>(
          builder: (controller) => LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  CustomContainer(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
                      child: SignUpAuthSection(),
                    ),
                  )),
        ),
      ),
    );
  }
}
