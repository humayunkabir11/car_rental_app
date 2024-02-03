import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/view/screens/search/search_controller/search_controller.dart';
import 'package:renti_user/view/screens/search/search_model/search_model.dart';
import 'package:renti_user/view/screens/search/search_repo/search_repo.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class SearchesCarSection extends StatelessWidget {
  const SearchesCarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(builder: (controller){

      return controller.isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : Column(
        children: List.generate(
          controller.carList.length,
              (index) => GestureDetector(
                onTap: () => Get.toNamed(AppRoute.carDetails, arguments: controller.carList[index].id),
                child: Container(
            margin: const EdgeInsetsDirectional.only(top: 8),
            decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.whiteNormalActive, width: 1),
                  color: AppColors.whiteLight,
                  borderRadius: BorderRadius.circular(8)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textAlign: TextAlign.start,
                        left: 12,
                        bottom: 12,
                        text: controller.carList[index].carModelName ?? "",
                        color: AppColors.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.lucidFuel),
                                CustomText(
                                  left: 8,
                                  right: 8,
                                  text: controller.carList[index].totalRun ?? "",
                                  color: AppColors.whiteDark,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text:
                                        '\$ ${controller.carList[index].hourlyRate ?? ""}',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF595959),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          height: 1.40,
                                        ),
                                      ),
                                      const TextSpan(
                                          text: '/hr',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ))
                                    ]))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 120,
                    height: 80,
                    decoration:   ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(controller.carList[index].image![0]),
                        // image: AssetImage(AppImages.carBg),
                        fit: BoxFit.cover,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                      ),
                    ),
                  ),
                ],
            ),
          ),
              ),
        ),
      );
    });
  }
}
