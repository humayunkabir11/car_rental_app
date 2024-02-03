import 'dart:convert';

import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';

class CarDetailsRepo{

  ApiService apiService;
  CarDetailsRepo({required this.apiService});

  Future<ApiResponseModel> fetchCarDetails({required String id}) async{

    String uri = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.carDetailsEndPoint}/$id";

    String requestMethod = ApiResponseMethod.getMethod;
    
    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);
    
    return responseModel;
  }

  Future<ApiResponseModel> sentRentRequest({required String carId, required String startDate, required String endDate}) async{

    String uri = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.sentRentRequestEndPoint}/$carId";
    print("Url: $uri");

    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, dynamic> params = {
      "startDate": startDate,
      "endDate": endDate
    };

    print("params : ${params.toString()}");


    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);
    print("data: ${responseModel.responseJson.toString()}");
    print("status: ${responseModel.statusCode}");
    print("success: ${responseModel.message}");

    return responseModel;
  }
}

