import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';
import 'package:renti_user/view/screens/trip_details/inner_widgets/host_information.dart';
import 'package:renti_user/view/screens/trip_details/inner_widgets/payment_section.dart';
import 'package:renti_user/view/screens/trip_details/inner_widgets/rental_info.dart';
import 'package:renti_user/view/screens/trip_details/inner_widgets/top_upload_scetion.dart';
import 'package:renti_user/view/screens/trip_details/make_payment/make_payment_screen.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {

  final _rentController =Get.find<RentHistoryController>();

   late int index;
  @override
  void initState() {
    DeviceUtils.authUtils();
    index = Get.arguments;
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(RentHistoryRepo(apiService: Get.find()));
    final controller = Get.put(RentHistoryController(rentHistoryRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
      print(index);
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

    return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
              appBarContent: Row(
                children: [
                 IconButton(onPressed: (){
                   Get.back();
                 }, splashColor: Colors.transparent,
                     highlightColor: Colors.transparent,
                     icon: const Icon(Icons.arrow_back_ios_new,color: AppColors.blackNormal,size: 18,)),
                   const SizedBox(width: 8),
                  Text(
                    "Trip Details".tr,
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
            builder: (controller) => SingleChildScrollView(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
              child: controller.isLoading ? const Center(
                child: CircularProgressIndicator(),
              ) : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopUploadSection(index: index),
                  const SizedBox(height: 16),
                  RentalInfo(index: index),
                  const SizedBox(height: 24,),
                  HostInfo(index: index),
                  const SizedBox(height: 32,),
                  PaymentSection(index: index)
                ],
              ),
            ),
          )),
          bottomNavigationBar: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
              padding: const EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                children: [
                  CustomElevatedButton(
                    onPressed: () async{
                      // await StripeApi().makePayment(amount: "1000", currency: "INR", index: index);
                        Navigator.push(context,MaterialPageRoute(builder:
                            (_)=>MakePaymentScreen(rentId:_rentController.rentHistoryModel.userWiseRent![index].id?? "", index:index??0,
                        ))
                        );
                      print("=======> Host id  ${_rentController.rentHistoryModel.userWiseRent![0].hostId!.id}");
                    },
                    titleText: "Make Payment".tr,
                    buttonWidth: MediaQuery.of(context).size.width,
                  ),
                 const SizedBox(height: 12,),
                  GetBuilder<RentHistoryController>(
                      builder: (controller) => controller.isSubmit ? const SizedBox(
                        height: 20, width: 20,
                        child: CircularProgressIndicator(),
                      ) : CustomElevatedButton(
                        onPressed: () => controller.cancelRequest(controller.rentUser.value[index].id.toString()),
                        buttonColor: Colors.transparent,
                        titleText: "Cancel Request".tr,
                        titleColor: AppColors.primaryColor,
                        buttonWidth: MediaQuery.of(context).size.width,
                        isBorder: true,
                      )
                  )
                ],
              ),
            )
        )
    );
  }
}
