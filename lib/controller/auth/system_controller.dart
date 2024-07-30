import 'package:hgp/core/constant/color.dart';
import 'package:hgp/core/constant/imageasset.dart';
import 'package:hgp/linkapi.dart';
import 'package:hgp/view/widget/custom_snackbar.dart';
import 'package:http/http.dart';
import 'package:hgp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity/connectivity.dart';

//kol page lazem ykon laha controller page login 3andha controller , page signup 3andeha controller ...
  class SystemController extends GetxController {
  GoToCalcul() {}

}
 
//lazem na7e9eneha fel page login
class SystemControllerImp extends SystemController {
    
  var selectedRadioFaceOne = ''.obs;

  void setSelectedRadioFaceOne(String value) {
    selectedRadioFaceOne.value = value;
  }

 var selectedRadioFaceTwo = ''.obs;

  void setSelectedRadioFaceTwo(String value) {
    selectedRadioFaceTwo.value = value;
  }

  
    @override
  GoToCalcul() {
print("face 01 :$selectedRadioFaceOne");
print("face 02 :$selectedRadioFaceTwo");
  Get.offNamed(AppRoute.calcull);


	 

  }
  @override
  void onInit() {
  

    super.onInit();
  }

  @override
  void dispose() {
 

    super.dispose();
  }

}
