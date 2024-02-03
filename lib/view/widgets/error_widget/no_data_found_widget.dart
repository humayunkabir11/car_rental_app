import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomImage(
            imageSrc: "assets/images/no_car.svg",
            imageType: ImageType.svg,
          ),
          const SizedBox(height: 8),
          Text(
            "No Data Found".tr,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: const Color(0xffCCCCCC),
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}
