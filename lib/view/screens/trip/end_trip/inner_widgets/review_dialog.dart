
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/widgets/buttons/custom_elevated_button.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({super.key});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}
class _ReviewDialogState extends State<ReviewDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.whiteLight,
      titlePadding: const EdgeInsets.only(top: 16,bottom: 24),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(AppStrings.review.tr),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: const CustomImage(
                        size: 22,
                        imageType: ImageType.svg,
                        imageSrc:
                        AppIcons.deleteIcon
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                   CustomText(
                    text: AppStrings.giveReviewTitle.tr,
                    color: AppColors.blackNormal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 16,),
                  RatingBarIndicator(
                    rating: 3.75,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 40.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(height: 32,),
                  TextFormField(
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackNormal
                    ),
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "give your review here........".tr,

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.whiteNormalActive,

                            )
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.whiteNormalActive,

                            )
                        )
                    ),
                  ),
                  const SizedBox(height: 14,),
                  CustomElevatedButton(
                    buttonHeight: 50,
                    buttonWidth: MediaQuery.of(context).size.width,
                    onPressed: () {

                    },
                    titleText: AppStrings.sendReview.tr,
                    titleSize: 18,
                    titleWeight: FontWeight.w600,
                  ),
                ],
              ),
            )

          ]
      ),
    );

  }
}