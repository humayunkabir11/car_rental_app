import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/luxury_car_model/luxury_car_model.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_model/offer_car_model.dart';
import 'package:renti_user/view/screens/home/home_repo/home_repo.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_model/profile_details_model.dart';

class HomeController extends GetxController{

  HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  bool isLoading = false;

  OfferCarModel offerCarModel = OfferCarModel();
  ProfileDetailsModel profileDetailsModel = ProfileDetailsModel();
  LuxuryCarModel luxuryCarModel = LuxuryCarModel();

  List<OfferCar> offerCarList = [];
  List<LuxuryCar> luxuryCarList = [];

  String profileImage = "";
  String userName = "";
  String phoneNumber = "";

  void initialState() async{

    offerCarList.clear();
    luxuryCarList.clear();

    isLoading = true;
    update();

    await loadUserData();
    await loadOfferCarData();
    await loadLuxuryCarData();

    isLoading = false;
    update();
  }
  loadUserData() async{
    ApiResponseModel responseModel = await homeRepo.fetchUserData();
    if(responseModel.statusCode == 200){
      ProfileDetailsModel model = ProfileDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
      profileImage = model.user?.image ?? "assets/images/user.png";
    }
  }

  loadOfferCarData() async{
    ApiResponseModel responseModel = await homeRepo.fetchOfferCarsData();
    if(responseModel.statusCode == 200){
      OfferCarModel model = OfferCarModel.fromJson(jsonDecode(responseModel.responseJson));
      List<OfferCar>? tempList = model.offerCars;
      if(tempList != null && tempList.isNotEmpty){
        offerCarList.addAll(tempList);
      }
    }
  }

  loadLuxuryCarData() async{
    ApiResponseModel responseModel = await homeRepo.fetchLuxuryCarsData();
    if(responseModel.statusCode == 200){
      LuxuryCarModel model = LuxuryCarModel.fromJson(jsonDecode(responseModel.responseJson));
      List<LuxuryCar>? tempList = model.luxuryCars;
      if(tempList != null && tempList.isNotEmpty){
        luxuryCarList.addAll(tempList);
      }
    }
  }

}