import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/auth/select_photo/inner_widgets/select_photo_bottom_nav_section.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';

import '../../../../utils/app_colors.dart';

import '../../../widgets/appbar/custom_app_bar.dart';
import '../../../widgets/buttons/custom_back_button.dart';
import '../../../widgets/container/custom_container.dart';
import '../../../widgets/text/custom_text.dart';

class SelectPhotoScreen extends StatefulWidget {
  const SelectPhotoScreen({super.key});

  @override
  State<SelectPhotoScreen> createState() => _SelectPhotoScreenState();
}

class _SelectPhotoScreenState extends State<SelectPhotoScreen> {
  @override
  void initState() {
    DeviceUtils.screenUtils();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.primaryColor,
          appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Select Photo".tr),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                GetBuilder<SignUpController>(builder: (controller) {
              return CustomContainer(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 24),
                  physics: const BouncingScrollPhysics(),
                  child: GestureDetector(
                      onTap: () {
                        controller.openGallery();
                      },
                      child: controller.imageFile == null
                          ? Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 2,
                                        strokeAlign: 1,
                                        style: BorderStyle.solid),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: AppColors.primaryColor,
                                        shape: BoxShape.circle),
                                    height: 130,
                                    width: 130,
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 50,
                                      color: AppColors.whiteDark,
                                    ),
                                  ),
                                ),
                                CustomText(
                                  top: 16,
                                  text: "Upload your photo".tr,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            )
                          : Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(controller.imageFile!.path)),
                                      fit: BoxFit.cover)),
                            )),
                ),
              );
            }),
          ),
          bottomNavigationBar: const SelectPhotoBottomNavSection()),
    );
  }
}
