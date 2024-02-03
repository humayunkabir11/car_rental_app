import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/utils/app_utils.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../profile_details/profile_details_controller/profile_details_controller.dart';

class EditProfileController extends GetxController {


  EditProfileController();
  File? imageFile;
  List<File> addImages = [];
  // final imagePicker = ImagePicker();
  // String? imageUrl;
  bool isLoading = false;
  bool isSubmit = false;
  var profileController = Get.find<ProfileDetailsController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String profileImage = "";
  String userId = "";
  var filePath="".obs;

  void openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 50);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      addImages.add(imageFile!);
      filePath.value=pickedFile.path;
      update();
    }
  }


  Future<void> updateUserInfo(String userId) async {
    isSubmit = true;
    update();
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(SharedPreferenceHelper.accessTokenKey);

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.updateProfile}$userId"),
      );
       if(filePath.isNotEmpty){
        request.files.add(await http.MultipartFile.fromPath('image', filePath.value,contentType: MediaType('image', 'jpeg')));
      }



      // for (var img in addImages) {
      //   if (imageFile != null && img.existsSync()) {
      //     try {
      //       var multipartImg = await http.MultipartFile.fromPath(
      //           'image', img.path,
      //           contentType: MediaType('image', 'jpeg'));
      //       request.files.add(multipartImg);
      //     } on Exception catch (e) {
      //       print("Error is :${e.toString()}");
      //     }
      //   } else {
      //     print('File does not exist: ${img.path}');
      //   }
      // }
      // Add the parameters to the request
      Map<String, dynamic> params = {
        "fullName": nameController.text,
        "email": emailController.text,
        "phoneNumber": numberController.text,
        "address": addressController.text,
      };

      params.forEach((key, value) {
        request.fields[key] = value;
      });

      request.headers['Content-Type'] = 'multipart/form-data';
      request.headers['Authorization'] = "Bearer $token";

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {

        profileController.initialState();
        update();
        AppUtils.errorToastMessage("Successfully profile updated".tr);
        Get.back();
        print(response.statusCode);

      } else if (response.statusCode == 503) {
        AppUtils.errorToastMessage("Somethings went wrong ${response.statusCode}");
      }
    } catch (e) {
      AppUtils.errorToastMessage("Somethings went wrong $e");
    }
    isSubmit = false;
    update();
  }

}
