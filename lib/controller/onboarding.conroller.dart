import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/core/services/services.dart';
import 'package:hgp/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
// 7e9ena shared Preferences
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      //m3aneteha chafe onboarding we derna shared preferences
      myServices.sharedPreferences.setString("onbording", "1");
      Get.offAllNamed(AppRoute.home);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(microseconds: 900), curve: Curves.bounceIn);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
