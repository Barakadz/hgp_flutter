import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/core/localization/local_controller.dart';
import 'package:hgp/view/screen/language/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView {
  const Language({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/hgpp.jpg",
              width: 220,
            ),
            SizedBox(height: 20),
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(height: 20),
            CustomButtonLang(
                textbutton: "2".tr,
                onPressed: () {
                  controllerLang.changeLang("ar");
                  Get.toNamed(AppRoute.onBoarding);
                }),
            SizedBox(height: 10),
            CustomButtonLang(
                textbutton: "3".tr,
                onPressed: () {
                  controllerLang.changeLang("fr");
                  Get.toNamed(AppRoute.onBoarding);
                }),
            SizedBox(height: 10),
            CustomButtonLang(
                textbutton: "4".tr,
                onPressed: () {
                  controllerLang.changeLang("en");
                  Get.toNamed(AppRoute.onBoarding);
                }),
          ],
        ),
      ),
    );
  }
}
