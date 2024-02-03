import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/auth/otp/otp_controller/otp_controller.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_loading_button.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/buttons/custom_elevated_button.dart';

class OtpBottomNavSection extends StatefulWidget {
  final String email;
  final bool fromForgetScreen;
  const OtpBottomNavSection({required this.email, required this.fromForgetScreen,super.key});

  @override
  State<OtpBottomNavSection> createState() => _OtpBottomNavSectionState();
}

class _OtpBottomNavSectionState extends State<OtpBottomNavSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: controller.isSubmit ? const CustomElevatedLoadingButton() : CustomElevatedButton(
            onPressed: () => controller.verifyOtpResponse(widget.email, widget.fromForgetScreen),
            titleText: AppStrings.verify.tr
          ),
        );
      }
    );
  }
}
