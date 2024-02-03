import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_model/about_us_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_repo/about_us_repo.dart';

class AboutUstController extends GetxController{

  AboutUsRepo aboutUstRepo;

  AboutUstController( {required this.aboutUstRepo});

  @override
  void onReady() {
    aboutUsGetResponse();
    super.onReady();
  }

  bool isLoading = false;
  String content = "";

  Future<void> aboutUsGetResponse() async{
    isLoading = true;
    update();

    ApiResponseModel responseModel = await aboutUstRepo.aboutUsResponse();

    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      AboutUsModel aboutUsModel = AboutUsModel.fromJson(jsonDecode(responseModel.responseJson));
      content = aboutUsModel.about?.content ?? "";
    }
    else{
      isLoading = false;
      update();
    }

    isLoading = false;
    update();
  }

}