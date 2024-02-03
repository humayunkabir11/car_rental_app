import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/settings/settings/inner_widgets/setting_name.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_back_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryColor,
      appBar:  CustomAppBar(
        appBarContent: CustomBack(
          text: AppStrings.settings.tr,
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            CustomContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const SingleChildScrollView(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SettingName()
                  ],
                ),
              ),
            ),
      ),

    ));
  }
}
