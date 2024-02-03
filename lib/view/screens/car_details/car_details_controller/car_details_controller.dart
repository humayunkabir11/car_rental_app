import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
// import 'package:location/location.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/car_details/car_details_model/car_details_model.dart';
import 'package:renti_user/view/screens/car_details/car_details_repo/car_details_repo.dart';
import 'package:renti_user/view/screens/car_details/sent_rent_request_model/sent_rent_request_model.dart';

class CarDetailsController extends GetxController{

//get colaction

  getLocationAdress(String location )async{
    List<Location> locations = await locationFromAddress(location);
    return locations;
  }

  CarDetailsRepo carDetailsRepo;
  CarDetailsController({required this.carDetailsRepo});

  bool isLoading = false;
  CarDetailsModel carDetailsModel = CarDetailsModel();
  SentRentRequestModel sentRentRequestModel = SentRentRequestModel();

  double lat=0.0;
  double lan =0.0;
  // get car details data
  Future<void> loadCarDetailsData(String carId) async{
    isLoading = true;
    update();

    ApiResponseModel responseModel = await carDetailsRepo.fetchCarDetails(id: carId);
    if(responseModel.statusCode == 200){
      carDetailsModel = CarDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
       List<Location> demo = await getLocationAdress(carDetailsModel.cars!.carLocation ?? "");
       lat = demo[0].latitude;
       lan = demo[0].longitude;
    }
    else{
      print("Error");

    }

    isLoading = false;
    update();
  }

  // sent rent request
  TextEditingController startTripDateController = TextEditingController();
  TextEditingController endTripDateController = TextEditingController();

  bool isSubmit = false;
  String requestStatus = "";

  sentRentRequest({required String carId, required String startDate, required String endDate}) async{

    isSubmit = true;
    update();
      ApiResponseModel responseModel = await carDetailsRepo.sentRentRequest(
          startDate: startDate,
          endDate: endDate,
          carId: carId
      );

      if(responseModel.statusCode == 200){
        sentRentRequestModel = SentRentRequestModel.fromJson(jsonDecode(responseModel.responseJson));
        requestStatus = sentRentRequestModel.rents?.requestStatus ?? "";
        await carDetailsRepo.apiService.sharedPreferences.setString("request_status_key", requestStatus);
        AppUtils.successToastMessage("Request Sent Successfully".tr);
        gotoNextStep();

      }

      else if(startTripDateController.text.isEmpty || endTripDateController.text.isEmpty){
        AppUtils.successToastMessage("Please fill-up start date and end date".tr);
      }
      else if(responseModel.statusCode == 500){
        AppUtils.successToastMessage("Rent request already exits".tr);
      }

      else{
        AppUtils.successToastMessage("Internal server error");
      }

    clearData();
    isSubmit = false;
    update();
  }

  clearData() {
    startTripDateController.text = "";
    endTripDateController.text = "";
  }

  gotoNextStep() {
    Get.offAndToNamed(AppRoute.rentiHistory);
  }

  Future<void> startTripDatePicker(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme:  const ColorScheme.light(
              primary: AppColors.primaryColor, // <-- SEE HERE
              onPrimary: AppColors.whiteLight, // <-- SEE HERE
              onSurface: AppColors.primaryColor, // <-- SEE HERE
            ),
          ),
          child: child!
      ),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startTripDateController.text) {
      startTripDateController.text = "${picked.year}-${picked.month}-${picked.day}";
      update();
    }
  }
  Future<void> endTripDatePicker(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme:  const ColorScheme.light(
              primary: AppColors.primaryColor, // <-- SEE HERE
              onPrimary: AppColors.whiteLight, // <-- SEE HERE
              onSurface: AppColors.primaryColor, // <-- SEE HERE
            ),
          ),
          child: child!
      ),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endTripDateController.text) {
      endTripDateController.text = "${picked.year}-${picked.month}-${picked.day}";
      update();
    }
  }
}
