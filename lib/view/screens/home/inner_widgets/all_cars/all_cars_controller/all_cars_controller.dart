import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_model/all_cars_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_repo/all_cars_repo.dart';

class AllCarsController extends GetxController{
  AllCarsController({required this.allCarsRepo});
  AllCarsRepo allCarsRepo;
  TextEditingController  searchController = TextEditingController();
  AllCarsModel allCarsModel =  AllCarsModel();
  bool isLoading = false;
  List<Car> carList = [];

  @override
  void onInit() {
    allCarResult();
    super.onInit();
  }

  Future<void> allCarResult({String search = ""}) async{
    isLoading = true;
    update();

    ApiResponseModel responseModel = await allCarsRepo.allCarsRepoResponse(search: search);

    if(responseModel.statusCode == 200){
      allCarsModel = AllCarsModel.fromJson(jsonDecode(responseModel.responseJson));

      List<Car>? tempCarList = allCarsModel.cars;
      if(tempCarList != null && tempCarList.isNotEmpty){
        carList.addAll(tempCarList);
      }
    }
    else{

    }
    isLoading = false;
    update();
  }
}


