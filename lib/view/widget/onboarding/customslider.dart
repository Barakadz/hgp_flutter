import 'package:hgp/controller/onboarding.conroller.dart';
import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/data/datasource/static/static.dart';
import 'package:hgp/view/screen/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          //print(val);
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/logo-hgp.png",
                      width: 100,
                    ),
                    SizedBox(width: 30),
                    InkWell(
                      onTap: () {
                        Get.offAllNamed(AppRoute.home);
                      },
                      child: Text(
                        "onBoardingtitre".tr,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                    child: Image(
                        image: AssetImage(onBoardingList[i].image!),
                        fit: BoxFit.fitWidth)),
                const SizedBox(height: 10),
                Text(
                  onBoardingList[i].title!,
                  //jebeteha men theme data fel main
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Text(onBoardingList[i].body!,
                        textAlign: TextAlign.center,
                        //jebeteha men theme data fel main
                        style: Theme.of(context).textTheme.bodyLarge)),
              ],
            ));
  }
}
