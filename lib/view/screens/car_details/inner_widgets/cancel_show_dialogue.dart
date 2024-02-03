import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class CancelShowDialogue extends StatefulWidget {
  const CancelShowDialogue({super.key});

  @override
  State<CancelShowDialogue> createState() => _CancelShowDialogueState();
}

class _CancelShowDialogueState extends State<CancelShowDialogue> {
  List <dynamic> cancelReason = ["Wait to long","Wait to long","I have changed my mind","I have changed my route","Others"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      titlePadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      title : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: AppStrings.cancelTrip,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.blackNormal,

              ),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: const CustomImage(
                    size: 24,
                    imageType: ImageType.svg,
                    imageSrc: AppIcons.deleteIcon
                ),
              )
            ],
          ),
          const SizedBox(height: 24,),
          const Divider(height: 1,color: AppColors.blackLightHover,),
          const SizedBox(height: 16,),
          const CustomText(
            text: AppStrings.cancelTripTitle,
            color: Color(0xFF2E2C2C),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left:16.0),
            child: Column(
                children: List.generate(cancelReason.length, (index) =>  Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: index == selectedIndex
                                  ? AppColors.primaryColor
                                  : AppColors.whiteLight,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1,color: AppColors.whiteDark.withOpacity(0.3))
                          ),
                        ),
                        const SizedBox(width: 10,),
                        CustomText(
                          text: cancelReason[index],
                        ),
                      ],
                    ),
                  ),
                ),)
            ),
          ),

          const SizedBox(height: 26,),
          CustomElevatedButton(
            buttonWidth: MediaQuery.of(context).size.width,
            onPressed: () {
            },
            titleText: "Submit",
            titleSize: 18,
            titleWeight: FontWeight.w600,
          )
        ],
      ) ,
    );
  }
}
