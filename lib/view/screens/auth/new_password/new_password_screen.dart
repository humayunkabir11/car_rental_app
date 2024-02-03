import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/new_password/inner_widgets/new_password_auth_section.dart';
import 'package:renti_user/view/screens/auth/new_password/inner_widgets/new_password_bottom_nav_section.dart';
import 'package:renti_user/view/screens/auth/new_password/reset_password_controller/reset_password_controller.dart';
import 'package:renti_user/view/screens/auth/new_password/reset_password_repo/reset_password_repo.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => NewPasswordScreenState();
}

class NewPasswordScreenState extends State<NewPasswordScreen> {

  @override
  void initState() {

    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ResetPasswordRepo(apiService: Get.find()));
    Get.put(ResetPasswordController(repo: Get.find()));
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
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primaryColor,
        appBar:   CustomAppBar(
          appBarContent: CustomBack(
            text: "New Password".tr,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => GetBuilder<ResetPasswordController>(
            builder: (controller) {
              return CustomContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:  SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Your password must have 6 characters.".tr, fontSize: 16),
                      const NewPasswordAuthSection(),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
        bottomNavigationBar: GetBuilder<ResetPasswordController>(
          builder: (controller) {
            return const NewPassWordBottomNavSection();
          }
        ),
      ),
    );
  }
}