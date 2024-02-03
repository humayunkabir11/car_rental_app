import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/privacy_policy_controller/privacy_policy_controller.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/privacy_policy_repo/privacy_policy_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_back_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/error_widget/no_data_found_widget.dart';


class PrivatePolicyScreen extends StatefulWidget {
  const PrivatePolicyScreen({super.key});

  @override
  State<PrivatePolicyScreen> createState() => _PrivatePolicyScreenState();
}

class _PrivatePolicyScreenState extends State<PrivatePolicyScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(PrivacyPolicyRepo(apiService: Get.find()));
   final controller = Get.put(PrivacyPolicyController(privacyPolicyRepo: Get.find()));
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     controller.initialState();

   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar:  CustomAppBar(
        appBarContent: CustomBack(
          text: AppStrings.privacyPolicy.tr.toUpperCase(),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CustomContainer(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:  GetBuilder<PrivacyPolicyController>(
            builder: (controller) => controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),): controller.content!=null&&controller.content.isNotEmpty? SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Html(
                    data: controller.content.toString(),
                  )
                ],
              ),
            ):const NoDataFoundWidget()
          ),
        ),
      ),
    ));
  }
}
