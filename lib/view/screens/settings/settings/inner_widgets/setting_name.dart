import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
class SettingName extends StatefulWidget {
  const SettingName({super.key,
  });
  @override
  State<SettingName> createState() => _SettingNameState();
}

class _SettingNameState extends State<SettingName> {
  List settingData = ["Change Language", "Change Password","Terms & Conditions","Privacy Policy"];
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(settingData.length, (index){
          return  GestureDetector(
            onTap: (){
              if(index==0){
                Get.toNamed(AppRoute.changeLanguage);
              }
              else if(index==1){
                Get.toNamed(AppRoute.changePassword);
              }
              else if(index==2){
                Get.toNamed(AppRoute.termsConditions);
              }
              else if(index==3){
                Get.toNamed(AppRoute.privacyPolicy);
              }
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFE6E7F4)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows:  [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.01),
                      blurRadius: 10,
                      offset: const Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text:settingData[index].toString().tr,
                        color: AppColors.blackNormal,
                        fontSize: 16,
                      ),

                      const Icon(Icons.arrow_forward_ios,size: 16,color: Color(0xFF2E2C2C),)

                    ],
                  ),
                )

            ),
          );
        })
    );
  }
}