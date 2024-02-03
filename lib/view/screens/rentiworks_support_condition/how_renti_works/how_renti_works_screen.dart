import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/how_renti_works/how_renti_work_repo/how_renti_works_repo.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/how_renti_works/how_renti_works_controller/how_renti_works_controller.dart';
import 'package:renti_user/view/widgets/error_widget/no_data_found_widget.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';

class HowRentiWorksScreen extends StatefulWidget {
  const HowRentiWorksScreen({super.key});

  @override
  State<HowRentiWorksScreen> createState() => _HowRentiWorksScreenState();
}

class _HowRentiWorksScreenState extends State<HowRentiWorksScreen> {
  @override
  void initState() {
    DeviceUtils.authUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(HowRentiWorksRepo(apiService: Get.find()));
    final controller =
        Get.put(HowRentiWorksController(howRentiWorksRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar: CustomAppBar(
              appBarContent: CustomBack(
                text: AppStrings.rentiWorks.tr,
              ),
            ),
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  GetBuilder<HowRentiWorksController>(
                      builder: (controller) => controller.isLoading
                          ? const Scaffold(
                              body: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            ))
                          : CustomContainer(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: controller.content.isNotEmpty &&
                                      controller.content != null
                                  ? SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      padding:
                                          const EdgeInsetsDirectional.symmetric(
                                              horizontal: 20, vertical: 24),
                                      child: Html(data: controller.content),
                                    )
                                  : const NoDataFoundWidget(),
                            )),
            )));
  }
}
