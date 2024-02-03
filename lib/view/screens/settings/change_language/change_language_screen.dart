import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/buttons/custom_back_button.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  List<String> languageName = [
    'English',
    'Spanish',
  ];
  int selectedItem = -1;
  // bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(
            text: "Change Language".tr,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              CustomContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    top: 24, left: 20, bottom: 100, right: 20),
                child: Column(
                  children: [
                    Column(
                      children: List.generate(
                        languageName.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              /*if(selectedItem==0){
                              Get.updateLocale(const Locale("en","US"));
                              Get.toNamed(AppRoute.settings);
                              AppUtils.successToastMessage("Change Language Successfully");
                            }
                            else if(selectedItem == 1){
                              Get.toNamed(AppRoute.settings);
                              AppUtils.successToastMessage("Cambiar idioma con éxito");
                              Get.updateLocale(const Locale("es","MX"));

                            }*/
                              setState(() {
                                selectedItem = index;
                                selectedItem == 0
                                    ? Get.updateLocale(const Locale("en", "US"))
                                    : Get.updateLocale(
                                        const Locale("es", "MX"));
                                Get.toNamed(AppRoute.settings);
                                selectedItem == 0
                                    ? AppUtils.successToastMessage(
                                        "Change Language Successfully")
                                    : AppUtils.successToastMessage(
                                        "Cambiar idioma con éxito");
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              width: MediaQuery.of(context).size.width,
                              decoration: ShapeDecoration(
                                color: AppColors.whiteLight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: AppColors.shadowColor,
                                    blurRadius: 10,
                                    offset: Offset(0, 1),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 16),
                                child: Row(
                                  children: [
                                    /* Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.black12.withOpacity(.2),
                                          width: 1),
                                      color: index == selectedItem
                                          ? AppColors.primaryColor
                                          : AppColors.whiteLight,
                                    ),
                                  ),*/
                                    CustomText(
                                      text: languageName[index],
                                      color: AppColors.blackNormal,
                                      left: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
