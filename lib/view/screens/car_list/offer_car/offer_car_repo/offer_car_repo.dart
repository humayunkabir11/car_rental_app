import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class OfferCarRepo{

  ApiService apiService;

  OfferCarRepo({required this.apiService});

 Future<ApiResponseModel> fetchOfferCar() async{

    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.offerCarEndPoint}";
    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);

    return responseModel;
  }
}