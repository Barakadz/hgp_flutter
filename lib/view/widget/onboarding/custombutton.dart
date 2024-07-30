import 'package:hgp/controller/onboarding.conroller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child:

          /* MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        child: Text(
          "Continue",
          style: TextStyle(),
        ),
        color: AppColor.primaryColor,
      ),*/
          GestureDetector(
        onTap: () {
          controller.next();
        },
        child: CircleAvatar(
          radius: 55.0,
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            Icons.chevron_right,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
