import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/luxury_car_model/luxury_car_model.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/luxury_car_repo/luxury_car_repo.dart';

class LuxuryCarController extends GetxController{

 LuxuryCarRepo luxuryCarRepo;
 LuxuryCarController({required this.luxuryCarRepo});

  bool isLoading = false;

LuxuryCarModel luxuryCarModel = LuxuryCarModel();

  List<LuxuryCar> luxuryCarList = [];

  void initialState() async{

    isLoading = true;
    update();

    await loadLuxuryCarData();

    isLoading = false;
    update();

  }

  Future<void> loadLuxuryCarData() async{

    ApiResponseModel responseModel = await luxuryCarRepo.fetchLuxuryCar();

    if(responseModel.statusCode == 200){
      luxuryCarModel = LuxuryCarModel.fromJson(jsonDecode(responseModel.responseJson));
      List<LuxuryCar>? tempLuxuryCarList = luxuryCarModel.luxuryCars;
      if(tempLuxuryCarList != null && tempLuxuryCarList.isNotEmpty){
        luxuryCarList.addAll(tempLuxuryCarList);
      }
    }
    else{
      print("Error");
    }
  }
}