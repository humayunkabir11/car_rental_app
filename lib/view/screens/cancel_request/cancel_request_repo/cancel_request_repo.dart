import 'dart:io';

import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class CancelRequestRepo{

  ApiService apiService;
  CancelRequestRepo({required this.apiService});

  Future<ApiResponseModel> fetchData({required String rentId}) async{

    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.rentDetailsEndPont}/$rentId";
    print("url: $url");

    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);
    print("status code: ${responseModel.statusCode}");

    return responseModel;
  }

  Future<ApiResponseModel> cancelRentRequest({required String rentId}) async{

    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.cancelRentRequestEndPoint}/$rentId";

    String requestMethod = ApiResponseMethod.postMethod;

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);

    return responseModel;
  }
}