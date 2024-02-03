import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../core/global/api_url_container.dart';
import '../../../core/helper/shared_preference_helper.dart';
import 'model/notification_model.dart';


class NotificationController extends GetxController{

  var loading=false.obs;
  RxList<AllNotification> allNotificationList=<AllNotification>[].obs;

  getNotification()async{
    try {
      loading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? t = prefs.getString(SharedPreferenceHelper.accessTokenKey);
      Map<String,String>headers= {
        "Content-Type": "application/json",
        "Authorization": "Bearer $t",
      };

      var url="${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.notificationEndPoint}";
      debugPrint("=====> Headers=> : $headers");
      debugPrint("=====> Url=> : $url");
      final response= await http.get(Uri.parse(url),headers:headers);
      if(response.statusCode==200){
        NotificationModel notificationModel =  notificationModelFromJson(response.body);
        allNotificationList.value=notificationModel.data!.allNotification!;
        debugPrint("===== Notification length : ${allNotificationList.length}");
        debugPrint("===== Notification length : ${response.body}");
      }else{
        debugPrint("Opps, Something error ${response.statusCode}");
      }
      loading(false);
    } on Exception catch (e) {
      debugPrint("Opps, Something error $e");
      loading(false);
    }




  }

// Future<ApiResponseModel> homeCarList({String search = ""}) async {
//   String uri =
//       "${ApiUrlContainer.baseUrl}${ApiUrlContainer.homeCarList}$search";
//   String requestMethod = ApiResponseMethod.getMethod;
//
//   ApiResponseModel responseModel =
//   await apiService.request(uri, requestMethod, null, passHeader: true);
//
//   return responseModel;
// }




}