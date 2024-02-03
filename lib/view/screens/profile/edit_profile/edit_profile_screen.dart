import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/screens/profile/edit_profile/edit_profile_controller/edit_profile_controller.dart';
import 'package:renti_user/view/screens/profile/edit_profile/inner_widgets/profile_settings_body_section.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_repo/profile_details_repo.dart';

import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import '../../../../utils/app_strings.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ProfileDetailsRepo(apiService: Get.find()));
    Get.put(EditProfileController());
    final controller = Get.put(ProfileDetailsController(profileDetailsRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
      backgroundColor: AppColors.whiteLight,
      appBar: CustomAppBar(
          appBarContent: Row(
        children: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: (){Get.back();}, icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: AppColors.blackNormal,
          ),),
           CustomText(
            text: AppStrings.profileSettings.tr,
            color: AppColors.blackNormal,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            left: 14,
          )
        ],
      )),
      body: GetBuilder<ProfileDetailsController>(
        builder: (controller) => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: controller.isLoading ? const Center(
                child: CircularProgressIndicator(),
              ) : const ProfileSettingsBodySection(),
            )
        ),
      ),
      bottomNavigationBar: GetBuilder<EditProfileController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: controller.isSubmit ? const CustomElevatedLoadingButton() : CustomElevatedButton(
              onPressed: () {
                controller.updateUserInfo(controller.userId);
              },
              titleText: AppStrings.updateprofile.tr
          ),
        ),
      )
    ));
  }
}
