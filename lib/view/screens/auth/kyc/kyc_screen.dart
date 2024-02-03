import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/kyc/inner_widgets/kyc_body_section.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_back_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';

class KYCScreen extends StatefulWidget {
  const KYCScreen({super.key});

  @override
  State<KYCScreen> createState() => _KYCScreenState();
}

class _KYCScreenState extends State<KYCScreen> {
  final formKey = GlobalKey<FormState>();

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
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "KYC".tr),
        ),
        body: GetBuilder<SignUpController>(
          builder: (controller) => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const SingleChildScrollView(
                padding: EdgeInsetsDirectional.symmetric(
                    vertical: 24, horizontal: 20),
                physics: BouncingScrollPhysics(),
                child: KycBodySection(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
