import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_controller/about_us_controller.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_repo/about_us_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_back_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/error_widget/no_data_found_widget.dart';
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(AboutUsRepo(apiService: Get.find()));
    Get.put(AboutUstController(aboutUstRepo: Get.find()));
    super.initState();
  }
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar:   CustomAppBar(
        appBarContent: CustomBack(
          text: AppStrings.aboutUs.tr,
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:  GetBuilder<AboutUstController>(
                builder: (controller) =>controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),): controller.content==""&&controller.content.isEmpty ? const NoDataFoundWidget(): SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Html(data: controller.content,),
                    ],
                  ),
                )
              ),
            ),
      ),
    ));
  }
}
