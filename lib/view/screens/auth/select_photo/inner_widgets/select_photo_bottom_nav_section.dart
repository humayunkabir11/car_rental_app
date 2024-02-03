import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class SelectPhotoBottomNavSection extends StatefulWidget {
  const SelectPhotoBottomNavSection({super.key});

  @override
  State<SelectPhotoBottomNavSection> createState() =>
      _SelectPhotoBottomNavSectionState();
}

class _SelectPhotoBottomNavSectionState
    extends State<SelectPhotoBottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: controller.isSubmit
            ? const CustomElevatedLoadingButton()
            : CustomElevatedButton(
                onPressed: () {
                  controller.signUpUser();
                },
                titleText: "Continue".tr),
      );
    });
  }
}
