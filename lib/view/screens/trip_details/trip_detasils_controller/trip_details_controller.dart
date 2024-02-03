import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/trip_details/trip_details_model/trip_details_model.dart';
import 'package:renti_user/view/screens/trip_details/trip_details_repo/trip_details_repo.dart';

class TripDetailsController extends GetxController {
  TripDetailsRepo tripDetailsRepo;
  TripDetailsController({required this.tripDetailsRepo});

  bool isLoading = false;
  TripDetailsModel tripDetailsModel = TripDetailsModel();
  Future loadData({required String rentId}) async {
    isLoading = true;
    update();
    ApiResponseModel responseModel =
        await tripDetailsRepo.fetchData(rentID: rentId);
    if (responseModel.statusCode == 200) {
      tripDetailsModel =
          TripDetailsModel.fromJson(jsonDecode(responseModel.responseJson));

      print(tripDetailsModel);
    }
    isLoading = false;
    update();
  }
}
