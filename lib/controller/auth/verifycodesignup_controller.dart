import 'package:hgp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:hgp/core/services/services.dart';
import 'package:hgp/view/widget/custom_snackbar.dart';
import 'package:http/http.dart';

//kol page lazem ykon laha controller page login 3andha controller , page signup 3andeha controller ...
abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  //tedini reset password page
  goToSuccessSignUp(String verifycodesignup);
}

//lazem na7e9eneha fel page login
class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? email;
  var isLoading = false.obs;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(String verifycodesignup) {
    void login() async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        try {
          isLoading(true);
          update();
          var response = await post(
              Uri.parse("https://groupe-hasnaoui.com/hgp/verifycode.php"),
              body: {
                'mail': email,
                'verifycode': verifycodesignup,
              });

          if (response.statusCode == 200) {
            var data = jsonDecode(response.body.toString());
            if (data['success'] == true) {
              var responsee = await post(
                  Uri.parse("https://groupe-hasnaoui.com/hgp/update_user.php"),
                  body: {
                    'mail': email,
                  });
              MyServices myServices = Get.find();
              myServices.sharedPreferences.setString("inscrire_mail", "$email");

              Get.offNamed(AppRoute.successSignUp);
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
          print(e.toString());
        } finally {
          isLoading(false);
        }
      } else {
        // Device is not connected to the internet
        customSnackbar("aucune connexion à Internet ",
            "il faut connecter pour s'inscrire", "error");
      }
    }

    login();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToSignUp() {
    // TODO: implement goToSignUp
  }
}
