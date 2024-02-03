import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_controller/rent_history_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/global/api_response_model.dart';
import '../../../../../../core/helper/shared_preference_helper.dart';
import '../../../../../../core/route/app_route.dart';
import '../../../../../../utils/app_constents.dart';
import '../../../../../../utils/app_utils.dart';
import '../card_details_model/model.dart';
import '../repo.dart';

class CardDetailsController extends GetxController {


  final rentHistoryController = Get.find<RentHistoryController>();

  /// <--------card controller ------->
  ///
    bool isLoading = false;

  CardRepo cardRepo;
  String cardNumber = "";

  CardDetailsController({required this.cardRepo});

  @override
  void onReady() {
    cardGetResponse();
    super.onReady();
  }

  CardDetailsModel cardDetailsModel = CardDetailsModel();
  Future<void> cardGetResponse() async {

    ApiResponseModel responseModel = await cardRepo.cardResponse();
    print("status code: ${responseModel.statusCode}");

    if (responseModel.statusCode == 200) {

      cardDetailsModel = CardDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
      cardNumber = cardDetailsModel.cardInfo?.creaditCardNumber ?? "";
      update();

    } else {

    }

  }

  Future<void> tokenizeCard(
      {required String rentId,
      required String productName,
      required int amount,
      required String email,
      required int index}) async {
    print(cardDetailsModel.cardInfo?.expireDate?.substring(0, 2) ?? "");
    print(cardDetailsModel.cardInfo?.expireDate?.substring(3, 5) ?? "");
    isLoading = true;
    update();
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${AppConstants.secretKeyStripe}'
      };
      var request = http.Request('POST', Uri.parse(ApiUrlContainer.stripeUrl));

      request.bodyFields = {
        'card[exp_month]': cardDetailsModel.cardInfo?.expireDate?.substring(0, 2) ?? "",
        'card[exp_year]': cardDetailsModel.cardInfo?.expireDate?.substring(3, 5) ?? "",
       'card[number]': cardDetailsModel.cardInfo?.creaditCardNumber.toString() ?? "",
        'card[cvc]': cardDetailsModel.cardInfo?.cvv.toString() ?? "",
      };
      request.headers.addAll(headers);

      request.bodyFields.forEach((key, value) {
        print('$key: $value');
      });

      request.headers.forEach((key, value) {
        print('$key: $value');
      });

      print("================headers : $headers");

      http.StreamedResponse response = await request.send();

      print("==============>>>>> $response");

      if (response.statusCode == 200) {
        var data = json.decode(await response.stream.bytesToString());
        print(data['id']);
        await payment(amount: amount, rentId: rentId, productName: productName, email: email, token: data['id'], index: index);
        isLoading = false;
        update();
      } else {
        print(response.reasonPhrase);
      }
    } on Exception catch (e) {
      AppUtils.successToastMessage(e.toString());
      // TODO
    }
    isLoading = false;
    update();
  }

  payment(
      {required String rentId,
      required String productName,
      required int amount,
      required String email,
      required String token,
      required int index}) async {
    try {
      Map<String, dynamic> body = {
        "product": {"name": productName, "price": amount},
        "token": {"email": email, "id": token}
      };

      print("==================body: $body");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String t = prefs.getString(SharedPreferenceHelper.accessTokenKey) ?? "";
      debugPrint("=======> bearer token :$t");
      debugPrint("=======> rentId :$rentId");
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $t'
      };
      debugPrint(
          "=======> Url : ${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.paymentApi}/$rentId");
      var response = await http.post(
          Uri.parse(
              "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.paymentApi}/$rentId"),
          body: json.encode(body),
          headers: headers);

      print('========================$response');
      if (response.statusCode == 200) {
        AppUtils.successToastMessage("Payment Completed");
        rentHistoryController.rentHistoryResult();
        Get.toNamed(AppRoute.startTrip, arguments: index);
        print("==========> response : ${response.body}");
      } else {
        print("==========> response error : ${response.body}");
      }
    } on Exception catch (e) {
      print("==========> catch error  : $e ");
    }
    isLoading = false;
    update();
  }
}
