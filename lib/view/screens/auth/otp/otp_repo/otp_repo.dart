import 'package:flutter/cupertino.dart';
import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';

class OTPRepo{

  ApiService apiService;
  OTPRepo({required this.apiService});

  verifyEmail({required String email, required String otpCode}) async{

    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.verifyEmailEndPoint}";
    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> params = {
      "oneTimeCode": otpCode,
      "email": email
    };

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, params, passHeader: false);

    return responseModel;
  }
  Future<ApiResponseModel> resendOtpVerifyResult() async{
    String uri = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.forgetPasswordEndPoint}";
    String requestMethod = ApiResponseMethod.postMethod;
    final String? email = apiService.sharedPreferences.getString( SharedPreferenceHelper.userEmailKey);
    debugPrint("=====================$email");
    Map<String, String> params = {
      "email" : email??""
    };

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: false);
    return responseModel;
  }
}