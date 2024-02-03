import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/screens/search/inner_widgets/searches_car_section.dart';
import 'package:renti_user/view/screens/search/search_controller/search_controller.dart';
import 'package:renti_user/view/screens/search/search_repo/search_repo.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/error_widget/no_data_found_widget.dart';
import 'package:renti_user/view/widgets/text_field/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    DeviceUtils.screenUtils();
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(SearchRepo(apiService: Get.find()));
    final controller = Get.put(SearchScreenController(searchRepo: Get.find()));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.searchResult();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<SearchScreenController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteLight,
          appBar: CustomAppBar(
              appBarContent: Text(
                "Search Car".tr,
                style: GoogleFonts.poppins(
                  color: AppColors.blackNormal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
          ),
          body: Padding(
            padding:  const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              children: [
                CustomTextField(
                  textEditingController: controller.searchController,
                  onChanged: (value) {
                     controller.searchResult(search: value.toString());
                     },

                  prefixIconSrc: AppIcons.searchIcon,
                  isPrefixIcon: true,
                  suffixIcon: GestureDetector(
                    onTap: (){
                      controller.searchController.clear();
                      controller.searchResult();
                    },
                    child: SvgPicture.asset(
                      AppIcons.deleteIcon,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  fieldBorderRadius: 8,
                  hintText: AppStrings.searchCar.tr,
                  inputTextStyle: GoogleFonts.poppins(
                    color: AppColors.blackNormal,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                  Expanded(
                  child:controller.isLoading?const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),):controller.carList !=null &&controller.carList.isNotEmpty ? const SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: SearchesCarSection()
                  ):const NoDataFoundWidget()
                  ),

              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
           );
          }
        );
      }
}
