import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class PrivacyPolicyRepo {

  ApiService apiService;
  PrivacyPolicyRepo({required this.apiService});

  Future<ApiResponseModel> privacyPolicyResponse() async{

    String uri = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.privacyPolicy}";

    String requestMethod = ApiResponseMethod.getMethod;
    Map<String,dynamic> body ={};

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod,body, passHeader: true);

    print(responseModel.responseJson.toString());
    return responseModel;
  }
}