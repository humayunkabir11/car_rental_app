import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/search/search_model/search_model.dart';
import 'package:renti_user/view/screens/search/search_repo/search_repo.dart';

class SearchScreenController extends GetxController{
  SearchRepo searchRepo;
  SearchScreenController({required this.searchRepo});
  TextEditingController  searchController = TextEditingController();
  SearchModel searchModel =  SearchModel();
  bool isLoading = false;
  List<Car> carList = [];

  Future<void> searchResult({ String search = ""}) async{
    carList.clear();
    isLoading = true;
    update();


    ApiResponseModel responseModel = await searchRepo.searchRepoResponse( search: search! );

    if(responseModel.statusCode == 200){
      searchModel = SearchModel.fromJson(jsonDecode(responseModel.responseJson));
      List<Car>? temCarList = searchModel.cars;
      if(temCarList != null && temCarList.isNotEmpty){
        carList.addAll(temCarList);
      }
    }

    isLoading = false;
    update();
  }

}
