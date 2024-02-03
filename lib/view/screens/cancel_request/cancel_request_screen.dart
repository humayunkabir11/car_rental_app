import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/cancel_request/inner_widgets/cancel_request_car_info_section.dart';
import 'package:renti_user/view/screens/cancel_request/inner_widgets/cancel_request_host_information.dart';
import 'package:renti_user/view/screens/cancel_request/inner_widgets/cancel_request_time_date_section.dart';
import 'package:renti_user/view/screens/cancel_request/inner_widgets/cancel_request_top_scetion.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';

import '../../../utils/app_colors.dart';
class CancelRequestScreen extends StatefulWidget {

  final int index;
  const CancelRequestScreen({required this.index, super.key});
  @override
  State<CancelRequestScreen> createState() => _CancelRequestScreenState();
}

class _CancelRequestScreenState extends State<CancelRequestScreen> {

  final socketService = SocketService();

 @override
 void initState() {
   DeviceUtils.authUtils();

   Get.put(ApiService(sharedPreferences: Get.find()));
   Get.put(RentHistoryRepo(apiService: Get.find()));
   final controller = Get.put(RentHistoryController(rentHistoryRepo: Get.find()));

   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

     socketService.socket;
     controller.initialState();
   });

    
   super.initState();
 }

  @override
  void dispose() {

    DeviceUtils.screenUtils();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    
    return  SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBarContent: Row(
            children: [
                 IconButton(
                   splashColor: Colors.transparent,
                   highlightColor: Colors.transparent,
                   onPressed: (){Get.back();}, icon:  const Icon(Icons.arrow_back_ios_new,color: AppColors.blackNormal,size: 18,),),
              Text(
                "Car Details".tr,
                style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.blackNormal
              ),
              )
            ],
          )
        ),
          body: LayoutBuilder(builder: (context, constraint) => GetBuilder<RentHistoryController>(
            builder: (controller) {
              return SingleChildScrollView(
                controller: scrollController,
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
                  child: controller.isLoading ? const Center(
                    child: CircularProgressIndicator(),
                  ) : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CancelRequestTopSection(index: widget.index),
                      const SizedBox(height: 24),
                      CancelRequestTimeDateSection(index: widget.index),
                      const SizedBox(height: 24),
                      CancelRequestCarInfoSection(index: widget.index),
                      const SizedBox(height: 24),
                      CancelRequestHostInfo(index: widget.index, socketService: socketService),
                    ],
                  ),
                );
            }
          )
        ),
        bottomNavigationBar: GetBuilder<RentHistoryController>(
          builder: (controller) => Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
            child: controller.isSubmit ? const SizedBox(
              height: 20, width: 20,
              child: CircularProgressIndicator(),
            ) : CustomElevatedButton(
              onPressed: () => controller.cancelRequest(controller.rentUser[widget.index].id.toString()),
              buttonColor: Colors.transparent,
              titleText: "Cancel Request".tr,
              titleColor: AppColors.primaryColor,
              buttonWidth: MediaQuery.of(context).size.width,
              isBorder: true,
            ),
          )
        ),
      )
    );
  }
}
