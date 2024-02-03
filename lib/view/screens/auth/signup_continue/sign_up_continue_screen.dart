import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:renti_user/view/screens/auth/signup_continue/inner_widgets/sign_up_continue_auth_section.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';

class SignUpContinueScreen extends StatefulWidget {
  const SignUpContinueScreen({super.key});

  @override
  State<SignUpContinueScreen> createState() => _SignUpContinueScreenState();
}

class _SignUpContinueScreenState extends State<SignUpContinueScreen> {

  @override
  void initState() {
    DeviceUtils.authUtils();
    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.authUtils();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: false, bottom: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.primaryColor,
        appBar: const CustomAppBar(appBarContent: CustomBack(text: AppStrings.signUp),),
        body: GetBuilder<SignUpController>(
          builder: (controller) => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsetsDirectional.symmetric(vertical: 24, horizontal: 20),
                child: SignUpContinueAuthSection(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}