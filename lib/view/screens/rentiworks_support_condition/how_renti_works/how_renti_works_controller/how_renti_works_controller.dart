import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/how_renti_works/how_renti_work_repo/how_renti_works_repo.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/how_renti_works/how_renti_works_model/how_renti_works_model.dart';

class HowRentiWorksController extends GetxController{

  HowRentiWorksRepo howRentiWorksRepo;

  HowRentiWorksController( {required this.howRentiWorksRepo});

  bool isLoading = false;
  String content = "";

  Future<void> loadData() async{
    isLoading = true;
    update();

    ApiResponseModel responseModel = await howRentiWorksRepo.fetchData();

    if(responseModel.statusCode == 200){

      HowRentiWorksModel howRentiWorksModel = HowRentiWorksModel.fromJson(jsonDecode(responseModel.responseJson));
      content = howRentiWorksModel.howRentiWork?.content ?? "";
    }

    isLoading = false;
    update();
  }
}