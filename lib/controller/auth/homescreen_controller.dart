import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hgp/view/screen/calcul.dart';
import 'package:hgp/view/screen/home.dart';
import 'package:hgp/view/screen/map.dart';
import 'package:hgp/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listpage = [
    HomePage(),
    const Calcul(),
    MapScreen(),
    Settings(),
  ];

  List titlebottomappbar = [
    "home".tr,
    "calcul".tr,
    "distributeurs".tr,
    "paramètres".tr
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
