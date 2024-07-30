import 'package:hgp/controller/onboarding.conroller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/data/datasource/static/static.dart';

import 'package:hgp/view/widget/onboarding/custombutton.dart';
import 'package:hgp/view/widget/onboarding/customslider.dart';
import 'package:hgp/view/widget/onboarding/dotconroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(flex: 4, child: const CustomSliderOnBoarding()),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CustomDotControllerOnBoarding(),
                SizedBox(width: 50),
                CustomButtonOnBoarding()
              ],
            ))
      ],
    )));
  }
}
