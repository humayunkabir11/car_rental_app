import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';

class ResetPasswordRepo{

  ApiService apiService;
  ResetPasswordRepo({required this.apiService});

  Future<ApiResponseModel> resetPassword({required String password}) async{

    String url = "${ApiUrlContainer.apiBaseUrl}/user/update-password";
    String requestMethod = ApiResponseMethod.postMethod;
    final String? email = apiService.sharedPreferences.getString(SharedPreferenceHelper.userEmailKey);
    Map<String, String> params = {"password" : password,"email" : email?? ""};

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, params, passHeader: false);

    return responseModel;
  }
}