import 'dart:convert';

import 'package:renti_user/core/global/api_response_method.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_model/profile_details_model.dart';
import 'package:renti_user/view/screens/profile/user_post_model/user_post_model.dart';
import 'package:http/http.dart' as http;

class ProfileDetailsRepo {
  ApiService apiService;
  ProfileDetailsRepo({required this.apiService});

  Future<ApiResponseModel> fetchProfileData() async {
    String url =
        "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.profileDetailsEndPoint}";
    String responseMethod = ApiResponseMethod.getMethod;

    ApiResponseModel responseModel =
    await apiService.request(url, responseMethod, null, passHeader: true);

    return responseModel;
  }
}
