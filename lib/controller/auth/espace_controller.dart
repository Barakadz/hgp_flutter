import 'package:dartz/dartz.dart';
import 'package:hgp/core/constant/color.dart';
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
abstract class EspaceController extends GetxController {
  //tedini signup page
  goToClient();
  goToPlaquiste();
}

//lazem na7e9eneha fel page login
class CalculControllerImp extends EspaceController {
  var isLoading = false.obs;

  @override
  goToClient() {
    void AddEspace() async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        try {
          isLoading(true);
          update();
          var response = await post(Uri.parse(AppLink.AddEspace),
              body: {'titre': 'Espace Particulier'});

          if (response.statusCode == 200) {
            var data = jsonDecode(response.body.toString());
            if (data['success'] == true) {
              Get.offNamed(AppRoute.accueil);
            } else {
              customSnackbar('erreur', data['message'], 'fff');
              isLoading(false);
              //pour refresh UI
              update();
            }
          } else {
            print("Failed");
          }
        } catch (e) {
          Get.offNamed(AppRoute.accueil);
        } finally {
          isLoading(false);
        }
      } else {
        Get.offNamed(AppRoute.accueil);
      }
    }

    AddEspace();
  }

  @override
  goToPlaquiste() {
    void AddEspace() async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        try {
          isLoading(true);
          update();
          var response = await post(Uri.parse(AppLink.AddEspace),
              body: {'titre': 'Espace Professionnelle'});

          if (response.statusCode == 200) {
            var data = jsonDecode(response.body.toString());
            if (data['success'] == true) {
              Get.offNamed(AppRoute.authPlaquiste);
            } else {
              customSnackbar('erreur', data['message'], 'fff');
              isLoading(false);
              //pour refresh UI
              update();
            }
          } else {
            print("Failed");
          }
        } catch (e) {
          Get.offNamed(AppRoute.authPlaquiste);
        } finally {
          isLoading(false);
        }
      } else {
        Get.offNamed(AppRoute.authPlaquiste);
      }
    }

    AddEspace();
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
