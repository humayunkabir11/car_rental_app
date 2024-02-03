import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/support/support_controller/support_controller.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/support/support_repo/support_repo.dart';
import 'package:renti_user/view/widgets/error_widget/no_data_found_widget.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  @override
  void initState() {
    DeviceUtils.authUtils();

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(SupportRepo(apiService: Get.find()));
    final controller = Get.put(SupportController(supportRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar:  CustomAppBar(
        appBarContent: CustomBack(
          text:AppStrings.support.tr,
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          return CustomContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GetBuilder<SupportController>(
              builder: (controller) =>controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :controller.content.isNotEmpty&&controller.content!=null? SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
                  physics: const BouncingScrollPhysics(),
                  child: Html(data: controller.content)
              ): const NoDataFoundWidget()
            ),
          );
        }
      ),
    ));
  }
}
