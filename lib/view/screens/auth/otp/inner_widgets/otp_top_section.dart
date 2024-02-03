import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:renti_user/view/screens/auth/otp/otp_controller/otp_controller.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_strings.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class OtpTopSection extends StatefulWidget {
  const OtpTopSection({super.key});

  @override
  State<OtpTopSection> createState() => _OtpTopSectionState();
}

class _OtpTopSectionState extends State<OtpTopSection> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<OtpController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CustomText(
            text: AppStrings.optCodeTitle.tr,
            fontSize: 16,
            bottom: 24,
          ),
          const Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              maxRadius: 50,
              child: CustomImage(imageSrc: AppIcons.otpLogo),
            ),
          ),
          const SizedBox(height: 40),
          PinCodeTextField(
            length: 4,
            obscureText: false,
            controller: controller.otpController,
            keyboardType: TextInputType.number,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            textStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.blackNormal),
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                disabledColor: Colors.blue,
                fieldHeight: 56,
                fieldWidth: 44,
                activeColor: AppColors.whiteNormalActive,
                inactiveColor: AppColors.whiteNormalActive,
                activeFillColor: AppColors.whiteNormalActive,
                inactiveFillColor: AppColors.whiteNormalActive,
                selectedFillColor: AppColors.whiteNormalActive,
                selectedColor: AppColors.whiteNormalActive),
            backgroundColor: Colors.transparent,
            enableActiveFill: false,
            onCompleted: (v) {},
            onChanged: (value) {},
            beforeTextPaste: (text) {
              return true;
            },
            appContext: context,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               CustomText(text:"Did not get OTP".tr),
              GestureDetector(
                onTap: () {
                  controller.resendOtpVerify();
                },
                child: controller.isResend ? const CircularProgressIndicator() :CustomText(
                  text: AppStrings.resend.tr,
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
