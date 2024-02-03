import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class SearchRepo{

  ApiService apiService;
  SearchRepo({required this.apiService});

  Future<ApiResponseModel> searchRepoResponse({required String search}) async{

    String uri = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.allCarsEndPoint}?search=$search";

    String requestMethod = ApiResponseMethod.getMethod;

    Map<String, String> params = {
    };
    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, params, passHeader: true);

    return responseModel;
  }
}