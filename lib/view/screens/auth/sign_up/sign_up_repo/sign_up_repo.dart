import 'dart:io';

import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class SignUpRepo{

  ApiService apiService;
  SignUpRepo({required this.apiService});

  Future<ApiResponseModel> createUser({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String gender,
    required String address,
    required String dateOfBirth,
    required String password,
    required List<File> kycImages,
    required File profileImage,
    required String ineNumber,
  }) async{

    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.signUpEndPoint}";

    String responseMethod = ApiResponseMethod.postMethod;

    Map<String, dynamic> params = {
      "fullName" : fullName,
      "email" : email,
      "phoneNumber" : phoneNumber,
      "gender" : gender,
      "address" : address,
      "dateOfBirth" : dateOfBirth,
      "password" : password,
      "image" : profileImage,
      "KYC" : kycImages,
      "ine" : ineNumber,
      "role" : "user"
    };

    ApiResponseModel responseModel = await apiService.request(url, responseMethod, params, passHeader: false);

    return responseModel;
  }
}