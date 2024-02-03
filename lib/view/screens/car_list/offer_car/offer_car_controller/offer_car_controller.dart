import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_model/offer_car_model.dart';

import 'package:renti_user/view/screens/car_list/offer_car/offer_car_repo/offer_car_repo.dart';

class OfferCarController extends GetxController{

  OfferCarRepo offerCarRepo;
  OfferCarController({required this.offerCarRepo});

  bool isLoading = false;

  OfferCarModel offerCarModel = OfferCarModel();

  List<OfferCar> offerCarList = [];

  void initialState() async{

    isLoading = true;
    update();

    await loadOfferCarData();

    isLoading = false;
    update();
  }

  Future<void> loadOfferCarData() async{

    ApiResponseModel responseModel = await offerCarRepo.fetchOfferCar();

    if(responseModel.statusCode == 200){
      offerCarModel = OfferCarModel.fromJson(jsonDecode(responseModel.responseJson));
      List<OfferCar>? tempOfferCarList = offerCarModel.offerCars;
      if(tempOfferCarList != null && tempOfferCarList.isNotEmpty){
        offerCarList.addAll(tempOfferCarList);
      }
    }
    else{
      print("Error");
    }
  }
}