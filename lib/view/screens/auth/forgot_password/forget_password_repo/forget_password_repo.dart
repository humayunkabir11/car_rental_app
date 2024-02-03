import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class ForgetPasswordRepo{

  ApiService apiService;
  ForgetPasswordRepo({required this.apiService});

  Future<ApiResponseModel> passEmail({required String email}) async{

    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.forgetPasswordEndPoint}";
    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> params = {
      "email" : email
    };

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, params, passHeader: true);

    return responseModel;
  }
}