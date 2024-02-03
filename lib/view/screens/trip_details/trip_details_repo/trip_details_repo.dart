import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';

class TripDetailsRepo{
  ApiService apiService;
  TripDetailsRepo({required this.apiService});

  Future<ApiResponseModel> fetchData({required String rentID}) async{

    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.rentDetailsEndPont}/$rentID";
    print("Url: $url");

    String requestMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel = await apiService.request(url, requestMethod, null, passHeader: true);

    return responseModel;
  }

  Future<ApiResponseModel> makePayment({required String rentID,required int productPrice,required String productName, required String cardNumber}) async{
    String url = "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.rentRequestPaymentEndPoint}/$rentID";
    String requestMethod = ApiResponseMethod.postMethod;
    Map<String, dynamic> params = {
      "product": {
        "name": productName,
        "price": productPrice
      },
      "token": {
        "email": apiService.sharedPreferences.getString(SharedPreferenceHelper.email)??"",
        "id": cardNumber
      }
    };
    print(params);
    print(requestMethod);
    print(url);
    ApiResponseModel responseModel = await apiService.request(url, requestMethod, params, passHeader: true);
    print(responseModel.statusCode);
    return responseModel;
  }
}