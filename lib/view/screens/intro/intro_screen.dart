import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/intro/inner_widgets/intro_bottom_section.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';

class IntroScreen extends StatefulWidget {

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  void initState() {
    DeviceUtils.splashUtils();
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
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.splashBgImage),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    CustomImage(
                        imageSrc: AppImages.splashLogo,
                        imageType: ImageType.png,
                        size: 200),
                    Spacer(),
                    IntroBottomSection()
                  ],
                ),
              ),
        ),

      ),
    );
  }
}