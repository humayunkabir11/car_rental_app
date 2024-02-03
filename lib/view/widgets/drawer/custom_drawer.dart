import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/logout/logout_controller/logout_controller.dart';
import 'package:renti_user/view/screens/logout/logout_repo/logout_repo.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_repo/profile_details_repo.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/home/home_controller/home_controller.dart';
import '../../screens/profile/profile_details/profile_details_controller/profile_details_controller.dart';
class CustomDrawer extends StatefulWidget {

  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}


class _CustomDrawerState extends State<CustomDrawer> {

  bool changeColor = false;

  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(LogoutRepo(apiService: Get.find()));
    Get.put(LogoutController(repo: Get.find()));

    Get.put(ProfileDetailsRepo(apiService: Get.find()));
    final profileController =  Get.put(ProfileDetailsController(profileDetailsRepo: Get.find()));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileController.initialState();

    });
    // final controller = Get.put(HomeController(homeRepo: Get.find()));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Get.put(ProfileDetailsController(profileDetailsRepo: Get.find()));
    return Drawer(
      width: 230,
      backgroundColor: AppColors.whiteLight,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Drawer Top Section
            const SizedBox(height: 30),
            GetBuilder<ProfileDetailsController>(

                builder: (proController) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      proController.isLoading?const SizedBox(
                        child: CircularProgressIndicator(),) : Container(
                          height: 60, width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: proController.profileImage.isEmpty ? const DecorationImage(
                                  image: AssetImage("assets/images/user.png"),
                                  fit: BoxFit.fill
                              ) : DecorationImage(
                                  image: CachedNetworkImageProvider(proController.profileImage),
                                  fit: BoxFit.fill
                              )
                          )
                      ),
                      CustomText(text:proController.username , fontSize: 16, fontWeight: FontWeight.w500,top: 8),
                      CustomText(text:"+52 ${proController.phoneNumber}", fontSize: 12, color: AppColors.whiteDarkHover,top: 8,bottom: 8),
                    ],);
                }
            ),

            const Divider(color: AppColors.blackLightHover,thickness: 1),
            // rent history
            InkWell(
              onTap: () => Get.toNamed(AppRoute.rentiHistory),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child:  Row(
                  children: [
                    const CustomImage(imageSrc: AppIcons.history,size: 18,),
                    CustomText(text: "Rent History".tr,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed(AppRoute.rentiWorks),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child:  Row(
                  children: [
                    const CustomImage(imageSrc: AppIcons.howRentiWorks,size: 18,),
                    Flexible(
                      child: CustomText(
                        text: "How Renti Works".tr,color: AppColors.whiteDarkHover,left: 8,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                    )
                  ],
                ),
              ),
            ),
            //support
            InkWell(
              onTap: () => Get.toNamed(AppRoute.support),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child:  Row(
                  children: [
                    const CustomImage(imageSrc: AppIcons.support1,size: 18,),
                    CustomText(text: AppStrings.support.tr,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            //aboutUs
            InkWell(
              onTap: () => Get.toNamed(AppRoute.aboutUs),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child:  Row(
                  children: [
                    const CustomImage(imageSrc: AppIcons.aboutUsIcon,size: 18,),
                    CustomText(text: AppStrings.aboutUs.tr,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            //settings
            InkWell(
              onTap: () => Get.toNamed(AppRoute.settings),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child:  Row(
                  children: [
                    const CustomImage(imageSrc: AppIcons.settingsIcon,size: 18,),
                    CustomText(text: AppStrings.settings.tr,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),
            const Divider(color: AppColors.blackLightHover,thickness: 1),
            // logOut
            InkWell(
              onTap: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: SizedBox(
                      width: 350,
                      child: Column(
                        children: [
                          Text(
                            "You sure want to log out".tr,
                            style: GoogleFonts.poppins(
                                color: AppColors.blackNormal,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 0),
                            child: Divider(
                              height: 1,
                              color: AppColors.whiteDarkHover,
                            ),
                          ),
                          GetBuilder<LogoutController>(
                            builder: (controller) {
                              return Row(
                                children: [
                                  Expanded(
                                      child:InkWell(
                                        onTap: () async{
                                          final SharedPreferences prefs = await SharedPreferences.getInstance();
                                          await prefs.remove(SharedPreferenceHelper.userIdKey);
                                          controller.logout();

                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: const Color(0x7FFBE9EC),
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child:  Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 11.5),
                                              child: Text(
                                                "Yes".tr,
                                                style: GoogleFonts.poppins(
                                                    color: AppColors.redNormal,
                                                    fontSize: 18,fontWeight: FontWeight.w600
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                        ),
                                      )
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          Get.back();
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: const Color(0xff000B90),
                                                borderRadius:
                                                BorderRadius.circular(8)),
                                            child:  Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 11.5),
                                              child: Text(
                                                "No".tr,
                                                style: GoogleFonts.poppins(
                                                    color: AppColors.whiteLight,
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.w600),
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                      )
                                  ),
                                ],
                              );
                            }
                          )
                        ],
                      ),
                    ),
                  );
                });
              },
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.whiteLight,
                    borderRadius: BorderRadius.circular(4)
                ),
                child:  Row(
                  children: [
                    const CustomImage(
                      imageSrc: AppIcons.logOutIcon,size: 18,),
                    CustomText(text: AppStrings.logOut.tr,color: AppColors.whiteDarkHover,left: 8)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
