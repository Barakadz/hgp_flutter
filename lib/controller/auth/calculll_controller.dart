 
import 'package:hgp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:hgp/view/widget/custom_snackbar.dart';
import 'package:http/http.dart';

//kol page lazem ykon laha controller page login 3andha controller , page signup 3andeha controller ...
abstract class VerifyCodeSignUpController extends GetxController {
   //tedini reset password page
 }

//lazem na7e9eneha fel page login
class CalculllControllerImp extends VerifyCodeSignUpController {
  var largeur;
  var hauteur;
 
  var depart;
  double h = 7;
  double l = 10;
    double d = 40;

  @override
  void onInit() {

hauteur = TextEditingController(text: h.toString());
     largeur = TextEditingController(text: l.toString());
    depart = TextEditingController(text: d.toString());
    super.onInit();
  }
  @override
  void dispose() {
    hauteur.dispose();
    largeur.dispose();
    depart.dispose();

    super.dispose();
  }


 
}
