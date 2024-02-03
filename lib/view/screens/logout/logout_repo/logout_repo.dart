import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class LogoutRepo{

  ApiService apiService;
  LogoutRepo({required this.apiService});

  Future<ApiResponseModel> userLogout() async{

    String uri = "${ApiUrlContainer.apiBaseUrl}/user/logout";

    String requestMethod = ApiResponseMethod.postMethod;

    Map<String, String> params = {};

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);

    return responseModel;
  }

  Future<ApiResponseModel>fetchUserData() async{
    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.profileDetailsEndPoint}";
    String requestMethod = ApiResponseMethod.getMethod;
    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);
    return responseModel;
  }

}