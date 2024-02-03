import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_icons.dart';
import 'package:renti_user/utils/app_strings.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:renti_user/view/widgets/image/custom_image.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

import 'hsbc_méxico_card.dart';

class PaymentSection extends StatefulWidget {

  final int index;
  const PaymentSection({required this.index, super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  
 bool isArrowUp = false;
 final ScrollController scrollController = ScrollController();
 
 void scrollToBottomExtentBefore() {
   scrollController.animateTo(
     scrollController.position.extentBefore,
     duration: const Duration(milliseconds: 50),
     curve: Curves.ease,
   );
 }

 void scrollToBottomExtentTotal() {
   scrollController.animateTo(
     scrollController.position.extentTotal,
     duration: const Duration(milliseconds: 1200),
     curve: Curves.easeIn,
   );
 }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<RentHistoryController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppStrings.totalAmount.tr,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor ,
              ),
              Text(
                "\$ ${controller.rentUser[widget.index].totalAmount ?? "0"}",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.right,
              )
            ],
          ),
          const SizedBox(height: 16),
         /* Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: ShapeDecoration(
                color: AppColors.whiteLight,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.5, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CustomImage(imageSrc: AppIcons.paymentIcon),
                      SizedBox(width: 16),
                      CustomText(
                        text: AppStrings.bankMexico,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  *//*InkWell(
                    onTap: (){
                      setState(() {
                        isArrowUp  =! isArrowUp;
                        isArrowUp?  scrollToBottomExtentTotal() : scrollToBottomExtentBefore();
                      });
                    },
                    child:isArrowUp? const Icon(Icons.keyboard_arrow_up,
                      size: 20,
                      color: AppColors.primaryColor,

                    ) : const Icon(Icons.keyboard_arrow_down,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  )*//*
                ],
              )
          ),*/
          isArrowUp ? const HsbcMexicoCard() : const SizedBox(),
        ],
      ),
    );
  }
}
