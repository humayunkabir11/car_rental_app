import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_model/request_cancel_response_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_model/rent_history_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class RentHistoryController extends GetxController{
  RentHistoryRepo rentHistoryRepo;
  RentHistoryController({required this.rentHistoryRepo});

  RentHistoryModel rentHistoryModel = RentHistoryModel();
  bool isLoading = false;
  RxList<UserWiseRent> rentUser = <UserWiseRent>[].obs;
  RequestCancelResponseModel requestCancelResponseModel = RequestCancelResponseModel();

  void initialState() async{
    rentUser.clear();
    isLoading = true;
    update();
    await rentHistoryResult();
    isLoading = false;
    update();
  }

  Future<void> rentHistoryResult() async{
    ApiResponseModel responseModel = await rentHistoryRepo.rentHistoryRepoResponse();
    if(responseModel.statusCode == 200){
      rentHistoryModel = RentHistoryModel.fromJson(jsonDecode(responseModel.responseJson));
      List<UserWiseRent>? tempCarList = rentHistoryModel.userWiseRent;
      if(tempCarList != null && tempCarList.isNotEmpty){
        rentUser.addAll(tempCarList);
        rentUser.refresh();
        update();
      }
    }
  }

  bool isSubmit = false;
  cancelRequest(String rentId) async{
    isSubmit = true;
    update();
    ApiResponseModel responseModel = await rentHistoryRepo.cancelRentRequest(rentId: rentId);
    if(responseModel.statusCode == 200){
      requestCancelResponseModel = RequestCancelResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      AppUtils.successToastMessage("Rent request cancel successfully");
      Get.offAndToNamed(AppRoute.rentiHistory);
    }
    else{

    }
    isSubmit = false;
    update();
  }

  List<File> addCarImages= [];
  File? firstImg;
  File? secondImg;
  File? thirdImg;
  final imagePicker = ImagePicker();


  void selectImage() async{
    if(firstImg==null){
      AppUtils.successToastMessage("Selecet Imadjdfohisgp ");
    }
  }

  void openGallery({required int index}) async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (index == 0) {
        firstImg = File(pickedFile.path);
        addCarImages.add(firstImg!);
        update();
      } else if (index == 1) {
        secondImg = File(pickedFile.path);
        addCarImages.add(secondImg!);
        update();
      } else if (index == 2) {
        thirdImg = File(pickedFile.path);
        addCarImages.add(thirdImg!);
        update();
      }
    }
  }

  Future<void> addCarMultipleFilesAndParams(String id) async {
    String? token = rentHistoryRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey);
    try {
      print("okay 1");
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.starTripEndPoint}/$id"),
      );
      print(request);
      for (var img in addCarImages) {
        if (img.existsSync()) {
          try {
            var multipartImg = await http.MultipartFile.fromPath(
                'carImage', img.path,
                contentType: MediaType('image', 'jpeg'));
            request.files.add(multipartImg);
          } on Exception catch (e) {
            print("Error is :${e.toString()}");
          }
        } else {
          print('File does not exist: ${img.path}');
        }
      }

      // Add the parameters to the request
      Map<String, String> params = {
        "tripStatus": "Start",
      };

      params.forEach((key, value) {
        request.fields[key] = value;
      });

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Authorization'] = 'Bearer $token';

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        Get.offAllNamed(AppRoute.homeScreen);
      } else {
        print(response.statusCode);
        print('Response body: ${await response.stream.bytesToString()}');
      }
    } catch (e) {
      print("okay 3");
      print(e.toString());
    }
  }

  //END TRIP Controller
  List<File> addCarImages1= [];
  File? firstImg1;
  File? secondImg1;
  File? thirdImg1;
  final imagePicker1 = ImagePicker();

  void openGallery1({required int index}) async {
    final pickedFile = await imagePicker1.pickImage(
      source: ImageSource.gallery,
      maxHeight: 120,
      maxWidth: 120,
    );

    if (pickedFile != null) {
      if (index == 0) {
        firstImg1 = File(pickedFile.path);
        addCarImages1.add(firstImg1!);
        update();
      } else if (index == 1) {
        secondImg1 = File(pickedFile.path);
        addCarImages1.add(secondImg1!);

        update();
      } else if (index == 2) {
        thirdImg1 = File(pickedFile.path);
        addCarImages1.add(thirdImg1!);

        update();
      }
    }
  }

  Future<void> addCarMultipleFilesAndParams1(String id) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(SharedPreferenceHelper.accessTokenKey);

    try {
      print("okay 1");
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.starTripEndPoint}/$id"),
      );

      for (var img in addCarImages1) {
        if (img.existsSync()) {
          try {
            var multipartImg = await http.MultipartFile.fromPath(
                'carImage', img.path,
                contentType: MediaType('image', 'jpeg'));
            request.files.add(multipartImg);
          } on Exception catch (e) {
            print("Error is :${e.toString()}");
          }
        } else {
          print('File does not exist: ${img.path}');
        }
      }

      // Add the parameters to the request
      Map<String, String> params = {
        "tripStatus": "End",
      };

      params.forEach((key, value) {
        request.fields[key] = value;
      });

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Authorization'] = 'Bearer $token';

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        Get.offAllNamed(AppRoute.homeScreen);
      } else {
        print(response.statusCode);
        print('Response body: ${await response.stream.bytesToString()}');
      }
    } catch (e) {
      print("okay 3");
      print(e.toString());
    }
  }

}


