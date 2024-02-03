import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class HowRentiWorksRepo {

  ApiService apiService;
  HowRentiWorksRepo({required this.apiService});

  Future<ApiResponseModel> fetchData() async{

    String uri = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.howRentiWorksEndPoint}";

    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);

    return responseModel;

  }
}