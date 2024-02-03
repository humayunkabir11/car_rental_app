import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class SupportRepo{

  ApiService apiService;
  SupportRepo({required this.apiService});

  Future<ApiResponseModel> fetchData() async{

    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.supportEndPoint}";
    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);

    return responseModel;
  }
}