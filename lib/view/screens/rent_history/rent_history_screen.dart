import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rent_history/inner_widgets/rent_history_section.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/appbar/custom_app_bar.dart';
import '../../widgets/text/custom_text.dart';

class RentHistoryScreen extends StatefulWidget {

  const RentHistoryScreen({super.key});

  @override
  State<RentHistoryScreen> createState() => _RentHistoryScreenState();
}

class _RentHistoryScreenState extends State<RentHistoryScreen> {

  final SocketService socketService = SocketService();

  @override
  void initState() {

    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(RentHistoryRepo(apiService: Get.find()));
    final controller = Get.put(RentHistoryController(rentHistoryRepo: Get.find()));
    // socketService.socket;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialState();
    });
    super.initState();
  }

  String requestCancel = "";

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
            text: AppStrings.rentiHistory.tr,
            color: AppColors.blackNormal,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            
          )
        ],
      )),
      body: GetBuilder<RentHistoryController>(
        builder: (controller) {
          return  controller .isLoading ? const Center(
            child: CircularProgressIndicator(),
          ) : controller.rentUser.isEmpty && controller.rentUser == "" ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomImage(imageSrc: "assets/images/no_car.svg", size: 150),
                const SizedBox(height: 12),
                Text(
                    "No Data Found".tr, textAlign: TextAlign.center, style: GoogleFonts.poppins(
                    color: AppColors.blackNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                ))
              ],
            ),
          ) : const SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            physics: BouncingScrollPhysics(),
            child: RentHistorySection(),
          );
        }
      )
    ));
  }
}
