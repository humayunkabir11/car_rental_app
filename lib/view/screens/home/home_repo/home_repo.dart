import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/api_service.dart';

class HomeRepo{

  ApiService apiService;
  HomeRepo({required this.apiService});

  fetchUserData() async{

    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.profileDetailsEndPoint}";
    String requestMethod = ApiResponseMethod.getMethod;
    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);

    return responseModel;
  }

  fetchOfferCarsData() async{
    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.offerCarEndPoint}";
    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);

    return responseModel;
  }

  fetchLuxuryCarsData() async{
    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.luxuryCarEndPoint}";
    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);

    return responseModel;
  }
}