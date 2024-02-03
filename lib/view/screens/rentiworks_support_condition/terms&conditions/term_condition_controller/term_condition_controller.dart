import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_model/about_us_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_repo/about_us_repo.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/term_condition_model/term_condition_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/term_condition_repo/term_condition_repo.dart';

class TermConditionController extends GetxController{

  TermConditionRepo termConditionRepo;

  TermConditionController( {required this.termConditionRepo});
  bool isLoading = true;
  String content = "";
  initialState(){
    isLoading = false;
    update();
    termAndConUsGetResponse();
    isLoading = true;
    update();
  }

  Future<void> termAndConUsGetResponse() async{


    ApiResponseModel responseModel = await termConditionRepo.ternConditionResponse();

    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      isLoading = false;
      update();
     TermConditionModel termConditionModel = TermConditionModel.fromJson(jsonDecode(responseModel.responseJson));
      content = termConditionModel.termsCondition!.content??"";
    }
  }

}