import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';


class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         const  CustomImage(imageSrc: AppIcons.noInternet,imageType: ImageType.svg,size: 40),
            CustomText(
              top: 24,
              text: "No Internet Connection Found".tr,
              fontSize: 16,
            ),
            CustomText(
              text: "Check Your Connection.".tr,
              bottom: 60,fontSize: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomElevatedButton(onPressed: ()=> Get.back(), titleText: "Back".tr,buttonWidth: double.maxFinite,buttonHeight: 42),
            ),
          ],
        ),
      ),
    );
  }
}