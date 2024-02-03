import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_model/cancel_request_model.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_model/request_cancel_response_model.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_repo/cancel_request_repo.dart';

class CancelRequestController extends GetxController{

  CancelRequestRepo cancelRequestRepo;
  CancelRequestController({required this.cancelRequestRepo});

  bool isLoading = false;
  CancelRequestModel model = CancelRequestModel();

  String image = "";

  loadData(String rentId) async{
    isLoading = true;
    update();

    print("rentId: $rentId");

    ApiResponseModel responseModel = await cancelRequestRepo.fetchData(rentId: rentId);
    print("status code: ${responseModel.statusCode}");
    if(responseModel.statusCode == 200){
      model = CancelRequestModel.fromJson(jsonDecode(responseModel.responseJson));
    }

    isLoading = false;
    update();
  }

  bool isSubmit = false;

  cancelRequest(String rentId) async{

    isSubmit = true;
    update();

    ApiResponseModel responseModel = await cancelRequestRepo.cancelRentRequest(rentId: rentId);
    if(responseModel.statusCode == 200){
      RequestCancelResponseModel requestCancelResponseModel = RequestCancelResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      AppUtils.successToastMessage("Rent request cancel successfully");
    }
    else{

    }

    isSubmit = false;
    update();
  }
}