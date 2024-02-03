import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_details/car_details_controller/car_details_controller.dart';
import 'package:renti_user/view/screens/car_details/car_details_repo/car_details_repo.dart';
import 'package:renti_user/view/screens/car_details/inner_widgets/car_details_top_section.dart';
import 'package:renti_user/view/screens/car_details/inner_widgets/from_until_section.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/text/custom_text.dart';

class CarDetailsScreen extends StatefulWidget {

 const CarDetailsScreen({super.key});
  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {

   late String carId;
  @override
  void initState() {
    carId = Get.arguments;
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(CarDetailsRepo(apiService: Get.find()));
    final controller = Get.put(CarDetailsController(carDetailsRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadCarDetailsData(carId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        top: true,
        child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: CustomAppBar(
            appBarContent: Row(
          children: [
           IconButton(
             splashColor: Colors.transparent,
             highlightColor: Colors.transparent,
             onPressed: (){Get.back();}, icon:  const Icon(
             Icons.arrow_back_ios_new,
             size: 18,
             color: AppColors.blackNormal,
           ),),
             CustomText(
              text: AppStrings.carDetails.tr,
              color: AppColors.blackNormal,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )
          ],
        )),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => GetBuilder<CarDetailsController>(
            builder: (controller) {
              return controller.isLoading ? const Center(
                child: CircularProgressIndicator(),
              ) : SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                           CarDetailsTopSection(),
                          const SizedBox(height: 24,),
                          FromUntilSection(carId: carId),
                        ],
                      )
                  );
            }
          ),
        ),
        )
      ),
    );
  }
}
