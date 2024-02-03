import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/auth/new_password/reset_password_controller/reset_password_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';

import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class NewPassWordBottomNavSection extends StatefulWidget {
  const NewPassWordBottomNavSection({super.key});

  @override
  State<NewPassWordBottomNavSection> createState() => _NewPassWordBottomNavSectionState();
}

class _NewPassWordBottomNavSectionState extends State<NewPassWordBottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: controller.isSubmit ? const CustomElevatedLoadingButton() : CustomElevatedButton(
            onPressed: () {
              if(controller.formKey.currentState!.validate()){
                controller.resetPassword();
              }
            },
            titleText: AppStrings.update.tr
          ),
        );
      }
    );
  }
}
