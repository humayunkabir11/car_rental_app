import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_controller/all_cars_controller.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_repo/all_cars_repo.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class SearchFilters extends StatefulWidget {
  const SearchFilters({super.key});

  @override
  State<SearchFilters> createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {

  List carModel = ["Toyota", "BMW", "Nissan", "Limberghini"];
  int selectedItem = 0;

  // void initState() {
  //
  //   Get.put(ApiService(sharedPreferences: Get.find()));
  //   Get.put(AllCarsRepo(apiService: Get.find()));
  //   Get.put(AllCarsController(allCarsRepo: Get.find()));
  //   super.initState();
  // }


  // late AllCarsController allCarsController;
  @override
  Widget build(BuildContext context) {

    return  GetBuilder<AllCarsController>(builder: (controller){
      return SizedBox(
        height: 52,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                cursorColor: AppColors.blackNormal,
                controller: controller.searchController,
                showCursor: true,
                onChanged: (value) {
                  Future.delayed(
                    const Duration(seconds: 1),
                        () {
                      controller.allCarResult(search: "?search=$value");
                    },
                  );
                },
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
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 55,
                child:  PopupMenuButton(
                  position: PopupMenuPosition.under,
                  elevation: 1,color: AppColors.whiteLight,
                  offset: const Offset(0, 1),
                  itemBuilder: (context) {
                    return List.generate(
                      carModel.length,
                          (index) {
                        return PopupMenuItem(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedItem = index;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectedItem==index
                                        ? AppColors.primaryColor
                                        : AppColors.whiteLight,
                                    border: Border.all(
                                        color: AppColors.lightBlueColor, width: 1),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                CustomText(text:
                                carModel[index],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsetsDirectional.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.whiteLight,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.whiteNormalActive, width: 1),
                    ),
                    child: const Icon(
                      Icons.filter_list_outlined,
                      color: AppColors.whiteNormalActive,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}