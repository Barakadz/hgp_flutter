import 'package:hgp/core/constant/imageasset.dart';
import 'package:hgp/data/model/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      //"onboardingtitle1".tr
      title: "onBoardingTitle1".tr,
      body: "onBoardingDescription1".tr,
      image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "onBoardingTitle2".tr,
      body: "onBoardingDescription2".tr,
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "onBoardingTitle3".tr,
      body: "onBoardingDescription3".tr,
      image: AppImageAsset.onBoardingImageThree),
  OnBoardingModel(
      title: "onBoardingTitle4".tr,
      body: "onBoardingDescription4".tr,
      image: AppImageAsset.onBoardingImageFour),
];
