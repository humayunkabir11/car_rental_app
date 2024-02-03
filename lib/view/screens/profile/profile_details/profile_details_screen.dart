import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/profile/profile_details/inner_widget/profile_details.dart';
import 'package:renti_user/view/screens/profile/profile_details/inner_widget/profile_top_section.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_repo/profile_details_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import '../../../../utils/app_colors.dart';

class ProfileDetailsScreen extends StatefulWidget {

  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {

  @override
  void initState() {

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(ProfileDetailsRepo(apiService: Get.find()));
    final controller = Get.put(ProfileDetailsController(profileDetailsRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
      backgroundColor: AppColors.whiteLight,
      
      appBar:  CustomAppBar(
        appBarContent: CustomText(
          text: AppStrings.profile.tr,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.blackNormal,
        ),
      ),
      body: GetBuilder<ProfileDetailsController>(
        builder: (controller) => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>controller.isLoading ? const Center(
              child: CircularProgressIndicator(),
            ) : const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child:  Column(
                children: [
                  ProfileTopSection(),
                  ProfileDetails()
                ],
              ),
            )),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    ));
  }
}
