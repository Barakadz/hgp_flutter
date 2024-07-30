import 'package:hgp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:hgp/view/widget/custom_snackbar.dart';
import 'package:http/http.dart';

//kol page lazem ykon laha controller page login 3andha controller , page signup 3andeha controller ...
abstract class calcullController extends GetxController {
   //tedini reset password page
   goToCalcull(){}
 }

//lazem na7e9eneha fel page login
class CalcullController extends calcullController {
  var largeur;
  
@override
   goToCalcull(){ 
   
    Get.offNamed(AppRoute.calculll  );
   }

 

  @override
  void onInit() {
  //  largeur = Get.arguments['largeur'];
    super.onInit();
  }

  @override
  goToSignUp() {
    // TODO: implement goToSignUp
  }
}
