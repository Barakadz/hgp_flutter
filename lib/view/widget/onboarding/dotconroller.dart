import 'package:hgp/controller/onboarding.conroller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          //hna ida kane active 3tihe width 40 we ida la 3tihe 25
                          width: controller.currentPage == index ? 40 : 25,

                          height: 6,
                          decoration: BoxDecoration(
                              color: controller.currentPage == index
                                  ? AppColor.primaryColor
                                  : AppColor.greyy,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
