import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_repo/sign_up_repo.dart';
import 'package:mime/mime.dart';

class SignUpController extends GetxController {
  SignUpRepo signUpRepo;
  SignUpController({required this.signUpRepo});

  bool isSubmit = false;

  TextEditingController fullNameController =
      TextEditingController();
  TextEditingController emailController =
      TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController passwordController =
      TextEditingController();
  TextEditingController confirmPasswordController =
      TextEditingController();
  TextEditingController phoneNumberController =
      TextEditingController();
  TextEditingController addressController =
      TextEditingController();
  TextEditingController creditCardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController ineNumberController =
      TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  List<String> genderList = ["Male", "Female", "Others"];
  int selectedGender = 0;
  List<File> kycDocFiles = [];
  File? profileImage;
  // String phoneCode = "+52";

  void changeGender(int index) {
    selectedGender = index;
    update();
  }

  void gotoNextStep() {
    Get.offAndToNamed(AppRoute.otpScreen,
        arguments: [emailController.text.toString(), false]);
  }

  File? uploadDrivingLicense;
  File? uploadPassport;
  String drivingLicenseFileName = "";
  String passportFileName = "";

  Future<void> pickDrivingLicenceFile() async {
    /*FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);
    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      if (file.extension == "pdf") {
        uploadDrivingLicense = File(result.files.single.path.toString());
        drivingLicenseFileName = result.files.single.name;
        kycDocFiles.add(uploadDrivingLicense!);
        update();
      } else {
        AppUtils.successToastMessage("only pdf file allow".tr);
      }
    }*/

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      uploadDrivingLicense = File(pickedFile.path);
      kycDocFiles.add(uploadDrivingLicense!);
      update();
    }
  }

  Future<void> pickPassportFile() async {
  /*  FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["pdf"],
        type: FileType.custom);

    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      if (file.extension == "pdf") {
        uploadPassport = File(result.files.single.path.toString());
        passportFileName = result.files.single.name;
        kycDocFiles.add(uploadPassport!);
        update();
      } else {
        AppUtils.successToastMessage("only pdf file allow".tr);
      }
    }*/

    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      uploadPassport = File(pickedFile.path);
      kycDocFiles.add(uploadPassport!);
      update();
    }
  }

  void removeDrivingLicenceFile() {
    uploadDrivingLicense = null;
    drivingLicenseFileName = "";
    kycDocFiles.removeAt(0);
    update();
  }

  void removePassportFile() {
    uploadPassport = null;
    passportFileName = "";
    kycDocFiles.removeAt(0);
    update();
  }

  File? imageFile;
  final imagePicker = ImagePicker();
  String? imageUrl;

  void openGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();
    }
  }

  void openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      update();
    }
  }

  Future<void> signUpUser() async {
    isSubmit = true;
    update();

    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              "${ApiUrlContainer.apiBaseUrl}${ApiUrlContainer.signUpEndPoint}"));

      // Add the KYC files to the request
      for (var file in kycDocFiles) {
        print("Files===================$file");
        if (file.existsSync()) {
          var mimeType = lookupMimeType(file.path);
          print("mimeType===================$mimeType");

          var multipartFile = await http.MultipartFile.fromPath(
            'KYC',
            file.path,
            contentType: MediaType.parse(mimeType!),
          );
          request.files.add(multipartFile);
        } else {
          print('File does not exist: ${file.path}');
        }
      }

      if (imageFile != null && imageFile!.existsSync()) {
        try {
          var mimeType = lookupMimeType(imageFile!.path);
          var img = await http.MultipartFile.fromPath('image', imageFile!.path,
              contentType: MediaType.parse(mimeType!));

          request.files.add(img);
        } on Exception catch (e) {
          print('Error adding image file to request: $e');
          // Handle the error gracefully, e.g., show an error message to the user.
        }
      }

      // Add the parameters to the request
      Map<String, String> params = {
        "fullName": fullNameController.text,
        "email": emailController.text,
        "phoneNumber": phoneNumberController.text,
        "gender": genderList[selectedGender],
        "address": addressController.text,
        "dateOfBirth": dateOfBirthController.text,
        "password": passwordController.text,
        "ine": ineNumberController.text,
        'creaditCardNumber': creditCardNumberController.text.replaceAll(' ', ''),
        'expireDate': expireDateController.text,
        'cvv': cvvController.text,
        "role": "user"
      };

      debugPrint("Params===============$params");

      params.forEach((key, value) {
        request.fields[key] = value;
      });

      request.headers['Content-Type'] = 'multipart/form-data';

      var response = await request.send();

      if (response.statusCode == 201) {
        gotoNextStep();
        print('Files uploaded successfully');
      } else if (response.statusCode == 409) {
        var response1 = await http.Response.fromStream(response);
        print(jsonDecode(response1.body));
        AppUtils.errorToastMessage('User already exists! Please login'.tr);
      } else {
        print('File upload failed with status code: ${response.statusCode}');
        AppUtils.errorToastMessage("File upload failed");
        print('Response body: ${response.stream.bytesToString()}');
      }
    } catch (e, s) {
      print('Error sending request: $e');
      print('Error s: $s');
    }

    isSubmit = false;
    update();
  }

  Future<void> dateOfBirthPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // <-- SEE HERE
              onPrimary: AppColors.whiteLight, // <-- SEE HERE
              onSurface: AppColors.primaryColor, // <-- SEE HERE
            ),
          ),
          child: child!),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dateOfBirthController.text) {
      dateOfBirthController.text =
          "${picked.year}-${picked.month}-${picked.day}";
      update();
      debugPrint(dateOfBirthController.text);
    }
    update();
  }
}
