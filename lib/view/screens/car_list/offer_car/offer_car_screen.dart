import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/car_list/offer_car/inner_widgets/offer_car_scetion.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_controller/offer_car_controller.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_repo/offer_car_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class PopularCarScreen extends StatefulWidget {

  const PopularCarScreen({super.key});
  @override
  State<PopularCarScreen> createState() => _PopularCarScreenState();
}
class _PopularCarScreenState extends State<PopularCarScreen> {

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(OfferCarRepo(apiService: Get.find()));
    final controller = Get.put(OfferCarController(offerCarRepo: Get.find()));

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
        appBar: CustomAppBar(
            appBarContent: Row(
              children: [
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,onPressed: (){Get.back();}, icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: AppColors.blackNormal,
                ),),
                 CustomText(
                  text: "Offer Cars".tr,
                  color: AppColors.blackNormal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  left: 14,
                )
              ],
            )),
        body: GetBuilder<OfferCarController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
            child:controller.isLoading ? const Center(
                child: CircularProgressIndicator()
            ) : Column(
              children: [
               /* TextFormField(
                  cursorColor: AppColors.blackNormal,
                  showCursor: true,
                  style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.blackNormal),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_outlined,size: 20,color: AppColors.whiteNormalActive),
                    hintText: AppStrings.searchCar,
                    hintStyle: const TextStyle(
                        color: AppColors.whiteNormalActive,
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.whiteNormalActive,width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.whiteNormalActive,width: 1),
                    ),
                  ),
                ),*/
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: controller.offerCarList.isEmpty ? const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                        ],
                      ),
                    ) : const OfferCarSection()
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}