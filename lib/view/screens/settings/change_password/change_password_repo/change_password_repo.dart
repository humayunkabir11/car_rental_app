import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';

class ChangePasswordRepo{

  ApiService apiService;
  ChangePasswordRepo({required this.apiService});

  Future<ApiResponseModel> changePassword({required String currentPassword, required String newPassword, required String retypePassword}) async{

    String uri = "${ApiUrlContainer.apiBaseUrl}/user/change-password";

    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> params = {
      "email" : apiService.sharedPreferences.getString(SharedPreferenceHelper.email).toString(),
      "currentPassword" : currentPassword,
      "newPassword" : newPassword,
      "reTypedPassword" : retypePassword,

    };
    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);

    return responseModel;
  }
}