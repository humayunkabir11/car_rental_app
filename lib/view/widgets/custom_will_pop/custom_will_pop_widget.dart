import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomWillPopWidget extends StatelessWidget {

  final Widget child;
  final String nextRoute;

  const CustomWillPopWidget({required this.child, this.nextRoute = "", super.key});
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        if(nextRoute.isEmpty){
          return Future.value(false);
        }
        else{
          Get.offAndToNamed(nextRoute);
          return Future.value(false);
        }
      },
      child: child,
    );
  }
}
