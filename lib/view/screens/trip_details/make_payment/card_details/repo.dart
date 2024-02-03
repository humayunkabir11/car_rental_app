import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class CardRepo {

  ApiService apiService;

  CardRepo({required this.apiService});

  Future<ApiResponseModel> cardResponse() async{

    String uri = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.cardEndPoint}";

    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(uri, requestMethod, null, passHeader: true);

    print(responseModel.responseJson.toString());
    return responseModel;
  }
}