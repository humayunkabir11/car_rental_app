import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';

class StripeApi {
  createPaymentIntent({required String amount, required String currency}) async {
    try{
      var response =await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: {
          "amount": "${amount}00",
          "currency": currency,
          "payment_method_types[]": "card"
        },
        headers: {
          'Authorization':
          'Bearer sk_test_51NrcLcSJXOqjAG5dahsxt4pz7cPpq1x7sjvjlnOMi219k6DYo2dVsJk6XE2Pih1p8FfblB00mh7tqCGPLmmKpFsu00cbtRcbQ2',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
      print(response.body);
      return jsonDecode(response.body);
    }catch(error){
      AppUtils.successToastMessage("Error $error");
    }
  }
  makePayment({required String amount, required String currency, required int index})async{
   Map<String,dynamic>? paymentIntentData;
    try{
      paymentIntentData = await createPaymentIntent(amount: amount, currency: currency);
      if(paymentIntentData != null){
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              merchantDisplayName: 'Mirza Mahmud',
              paymentIntentClientSecret: paymentIntentData["client_secret"],
              customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
              customerId: "id",
              allowsDelayedPaymentMethods: true,
              style: ThemeMode.light,
            )
        );
        await Stripe.instance.presentPaymentSheet();
        AppUtils.successToastMessage("Successfully");
        Get.toNamed(AppRoute.startTrip, arguments: index);
      }
    }catch(e){
      AppUtils.successToastMessage("Error $e");
    }
  }
}
