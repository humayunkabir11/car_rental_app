import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class AllCarsRepo{

  ApiService apiService;
  AllCarsRepo({required this.apiService});

  Future<ApiResponseModel> allCarsRepoResponse({String search = ""}) async{

    String uri = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.allCarsEndPoint}$search";

    String requestMethod = ApiResponseMethod.getMethod;

    Map<String, String> params = {

    };
    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);
    return responseModel;
  }
}

