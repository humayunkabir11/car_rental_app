import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/home/home_controller/home_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class HomeLuxuryCarSection extends StatelessWidget {

  const HomeLuxuryCarSection({super.key});
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(

      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: "Luxury Cars".tr,
                color: AppColors.blackNormal,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(AppRoute.allCarScreen);
                },
                child:   CustomText(
                  text: AppStrings.seeAll.tr,
                  color: AppColors.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          controller.luxuryCarList.isEmpty ? const CustomImage(
            imageSrc: "assets/images/no_car.svg",
            size: 200,
          ) : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics:   const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                  controller.luxuryCarList.length, (index) => GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.carDetails, arguments: controller.luxuryCarList[index].id.toString());
                    },
                    child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsetsDirectional.only(end: 12),
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: const EdgeInsetsDirectional.only(bottom: 12),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x33000000),
                              blurRadius: 2,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 120,
                              decoration:  ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(controller.luxuryCarList[index].image![0].toString()) ,
                                  // image: AssetImage(AppImages.carImage),
                                  fit: BoxFit.fill,
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                            CustomText(
                              left:12,
                              top:12,
                              bottom: 12,
                              text: controller.luxuryCarList[index].carModelName ?? "",
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(AppIcons.lucidFuel),
                                      CustomText(
                                        left: 8,
                                        text:"${controller.luxuryCarList[index].totalRun.toString()}${"/L"}",
                                        color: AppColors.whiteDark,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "${"\$"}${controller.luxuryCarList[index].hourlyRate.toString()}",
                                                  style: GoogleFonts.poppins(
                                                    color: const Color(0xFF595959),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                    text: '/hr',
                                                    style: GoogleFonts.openSans(
                                                      color: AppColors.primaryColor,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400,
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                    ],
                                  ),
                                ],),
                            ),
                          ],
                        ),
                      ),

                    ],
                ),
                  )
                ),
              )
          )
        ],
      )
    );
  }
}

