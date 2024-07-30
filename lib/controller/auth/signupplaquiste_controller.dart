import 'package:get/get.dart';
import 'package:hgp/controller/auth/communes.dart';
import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/linkapi.dart';
import 'package:hgp/view/widget/custom_snackbar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'wilayas.dart';

abstract class LoginController extends GetxController {
  signUp();
  goToSignUp();
  updateWilaya(String newWilaya);
  updateCommune(String newCommune);

}

class SignUpPlaquisteControllerImp extends LoginController {
  var isLoading = false.obs;
  var selectedWilaya = wilayas[0].obs;
var selectedCommune = "".obs;
  var communeList = <String>[].obs;
  @override
  void updateWilaya(String newWilaya) {
        selectedWilaya.value = newWilaya;
    communeList.value = communes[newWilaya] ?? [];
    if (communeList.isNotEmpty) {
      selectedCommune.value = communeList[0];
    } else {
      selectedCommune.value = "";
    }
  }

  @override
  void updateCommune(String newCommune) {
    selectedCommune.value = newCommune;
  }

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController nom;
  late TextEditingController prenom;
  late TextEditingController adresse;
  late TextEditingController email;
  late TextEditingController nom_dentreprise;
  late TextEditingController telephone;
  late TextEditingController password;

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        try {
          isLoading(true);
          update();
          var response = await http.post(Uri.parse(AppLink.signup), body: {
            'nom': nom.text,
            'prenom': prenom.text,
            'adresse': adresse.text,
            'nom_entreprise': nom_dentreprise.text,
            'mail': email.text,
            'telephone': telephone.text,
            'password': password.text,
            'wilaya': selectedWilaya.value,
          });

          if (response.statusCode == 200) {
            var data = jsonDecode(response.body.toString());
            if (data['success'] == true) {
              Get.offNamed(AppRoute.verfiyCodeSignUp, arguments: {
                "email": email.text,
              });
            } else {
              customSnackbar('Erreur', data['message'], 'fff');
              isLoading(false);
              update();
            }
          } else {
            print("Failed");
          }
        } catch (e) {
          print(e.toString());
        } finally {
          isLoading(false);
        }
      } else {
        customSnackbar("Aucune connexion à Internet",
            "Il faut se connecter pour s'inscrire", "error");
      }
    } else {
      print("not valid");
    }
    Get.delete<SignUpPlaquisteControllerImp>();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.loginPlaquiste);
  }

  @override
  void onInit() {
    nom = TextEditingController();
    prenom = TextEditingController();
    adresse = TextEditingController();
    email = TextEditingController();
    nom_dentreprise = TextEditingController();
    telephone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nom.dispose();
    prenom.dispose();
    adresse.dispose();
    email.dispose();
    nom_dentreprise.dispose();
    telephone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToSignUp() {
    // TODO: implement goToSignUp
    throw UnimplementedError();
  }
}
