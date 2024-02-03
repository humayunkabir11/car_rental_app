import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/privacy_policy_model/privacy_policy_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/privacy_policy_repo/privacy_policy_repo.dart';

class PrivacyPolicyController extends GetxController{

  PrivacyPolicyRepo privacyPolicyRepo;
  PrivacyPolicyController({required this.privacyPolicyRepo});

 // @override
 //  void onReady() {
 //    // TODO: implement onReady
 //   privacyPolicyGetResponse();
 //    super.onReady();
 //  }

  bool isLoading = true;
  String content = "";

     initialState (){
      isLoading = false;
      update();
      privacyPolicyGetResponse();
      isLoading = true;
      update();
    }
  Future<void> privacyPolicyGetResponse() async{
    ApiResponseModel responseModel = await privacyPolicyRepo.privacyPolicyResponse();

    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      isLoading = false;
      update();
     PrivacyPolicyModel  privacyPolicyModel = PrivacyPolicyModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${privacyPolicyModel.privacyPolicy.toString()}");
      content = privacyPolicyModel.privacyPolicy!.content??"";

    }
    // else{
    //   isLoading = false;
    //   update();
    // }

    // isLoading = false;
    // update();
  }

}