import 'package:get/get.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:renti_user/view/screens/auth/kyc/kyc_screen.dart';
import 'package:renti_user/view/screens/auth/new_password/new_password_screen.dart';
import 'package:renti_user/view/screens/auth/otp/otp_screen.dart';
import 'package:renti_user/view/screens/auth/select_photo/select_photo_screen.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:renti_user/view/screens/auth/signup_continue/sign_up_continue_screen.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_screen.dart';
import 'package:renti_user/view/screens/car_details/car_details_screen.dart';
import 'package:renti_user/view/screens/car_list/luxury_car/luxury_car_screen.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_screen.dart';
import 'package:renti_user/view/screens/home/home_screen.dart';
import 'package:renti_user/view/screens/intro/intro_screen.dart';
import 'package:renti_user/view/screens/message/inbox_screen.dart';
import 'package:renti_user/view/screens/message/messages_screen.dart';
import 'package:renti_user/view/screens/no_internet/no_internet_screen.dart';
import 'package:renti_user/view/screens/profile/edit_profile/edit_profile_screen.dart';


import 'package:renti_user/view/screens/profile/profile_details/profile_details_screen.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/how_renti_works/how_renti_works_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/private_policy_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/support/support_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/terms_conditions_screen.dart';
import 'package:renti_user/view/screens/search/search_screen.dart';
import 'package:renti_user/view/screens/select_language/select_language_screen.dart';
import 'package:renti_user/view/screens/settings/change_language/change_language_screen.dart';
import 'package:renti_user/view/screens/settings/change_password/change_password_screen.dart';
import 'package:renti_user/view/screens/settings/settings/settings_screen.dart';
import 'package:renti_user/view/screens/trip/end_trip/end_trip_screen.dart';
import 'package:renti_user/view/screens/trip/star_trip/start_trip_screen.dart';
import 'package:renti_user/view/screens/trip_details/trip_details_screen.dart';

class AppRoute {

  static const  String rentRequest = "/rent_request_screen";
  static const String homeScreen = "/home_screen";
  static const String searchScreen = "/search_screen";
  static const String startTrip = "/start_trip_screen";
  static const String endTrip = "/end_trip_screen";
  static const String popularCarScreen = "/popular_car_screen";
  static const String allCarScreen= "/all_cars_screen";
  static const String inboxScreen= "/inbox_screen";
  static const String messageScreen = "/message_screen";
  static const String cancelShowDialog = "/cancel_show_dialog";
  static const String introScreen = "/splash_screen";
  static const String selectLanguageScreen = "/select_language_screen";
  static const String signInScreen = "/signin_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String signUpContinueScreen = "/sign_up_continue_screen";
  static const String kycScreen = "/kyc_screen";
  static const String selectPhoto = "/select_photo_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String otpScreen = "/otp_screen";
  static const String newPassword = "/new_password";
  static const String profileDetails = "/profile_details";
  static const String profileSettingsScreen = "/profile_settings_screen";
  static const String rentiWorks = "/renti_works_screen";
  static const String support = "/support_screen";
  static const String aboutUs = "/about_us_screen";
  static const String termsConditions = "/terms_condiotions_screen";
  static const String privacyPolicy = "/privacy_policy_screen";
  static const String settings = "/settings_screen";
  static const String changeLanguage = "/change_language_screen";
  static const String changePassword = "/change_password_screen";
  static const String rentiHistory = "/renti_history_screen";
  static const String carDetails = "/car_details_screen";
  static const String cancelRequestScreen = "/cancel_request_screen";
  static const String noInternet = "/no_internet_screen";

  static List<GetPage> routes = [
    GetPage(name: rentRequest, page: ()=> const TripDetailsScreen()),
    GetPage(name: startTrip, page: ()=> const StartTripScreen()),
    GetPage(name: endTrip, page: ()=> const EndTripScreen()),
    GetPage(name: popularCarScreen, page: ()=>  const PopularCarScreen()),
    GetPage(name: inboxScreen, page: ()=>  const InboxScreen()),
    GetPage(name: messageScreen, page: ()=> const MessageScreen()),
    GetPage(name:allCarScreen , page: ()=>const AllCarScreen()),
    GetPage(name: introScreen, page: ()=> const IntroScreen()),
    GetPage(name: selectLanguageScreen, page: ()=> const SelectLanguageScreen()),
    GetPage(name: signInScreen, page: ()=>const SignInScreen()),
    GetPage(name: signUpScreen, page: ()=>const SignUpScreen()),
    GetPage(name: signUpContinueScreen, page: ()=>const SignUpContinueScreen()),
    GetPage(name: kycScreen, page: ()=>const KYCScreen()),
    GetPage(name: selectPhoto, page: ()=>const SelectPhotoScreen()),
    GetPage(name: forgotPasswordScreen, page: ()=>const ForgotPasswordScreen()),
    GetPage(name: otpScreen, page: ()=>const ForgotPassOTP()),
    GetPage(name: newPassword, page: ()=>const NewPasswordScreen()),
    GetPage(name: profileDetails, page: ()=>const ProfileDetailsScreen()),
    GetPage(name: profileSettingsScreen, page: ()=>const ProfileSettingsScreen()),
    GetPage(name: rentiWorks, page: ()=>const HowRentiWorksScreen()),
    GetPage(name: support, page: ()=>const SupportScreen()),
    GetPage(name: aboutUs, page: ()=>const AboutUsScreen()),
    GetPage(name: termsConditions, page: ()=>const TermsConditionsScreen()),
    GetPage(name: privacyPolicy, page: ()=> const PrivatePolicyScreen()),
    GetPage(name: settings, page: ()=>const SettingsScreen()),
    GetPage(name: changeLanguage, page: ()=>const ChangeLanguageScreen()),
    GetPage(name: changePassword, page: ()=>const ChangePasswordScreen()),
    GetPage(name: carDetails, page: ()=>const CarDetailsScreen()),
    GetPage(name: rentiHistory, page: ()=>const RentHistoryScreen()),
    GetPage(name: homeScreen, page: ()=>const HomeScreen()),
    GetPage(name: searchScreen, page: ()=>const SearchScreen()),
    GetPage(name: noInternet, page: ()=>const NoInternetScreen()),
    GetPage(name: cancelRequestScreen, page: ()=> CancelRequestScreen(index: Get.arguments)),
  ];
}