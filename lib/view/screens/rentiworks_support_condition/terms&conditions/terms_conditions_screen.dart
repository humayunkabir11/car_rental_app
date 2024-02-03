import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/term_condition_controller/term_condition_controller.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/term_condition_repo/term_condition_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_back_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/error_widget/no_data_found_widget.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(TermConditionRepo(apiService: Get.find()));
   final controller = Get.put(TermConditionController(termConditionRepo: Get.find()));
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     controller.initialState();
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar:  CustomAppBar(
        appBarContent: CustomBack(
          text:AppStrings.termsConditions.tr.toUpperCase(),
        ),
      ),
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:   GetBuilder<TermConditionController>(
                builder: (controller) =>controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),): controller.content.isNotEmpty && controller.content!=null? SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 24),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Html(data: controller.content.toString())
                    ],
                  ),
                ):const NoDataFoundWidget()
              ),
            ),
      ),
    ));
  }
}
