import 'package:hgp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//kol page lazem ykon laha controller page login 3andha controller , page signup 3andeha controller ...
abstract class LoginController extends GetxController {
  login();
  //tedini signup page
  goToSignUp();
  goToForgetPassword();
  goToCalcul();
}

//lazem na7e9eneha fel page login
class LoginControllerImp extends LoginController {
  //key linfewetoha lel form
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  //
  late TextEditingController email;
  late TextEditingController password;
  @override
  login() {
    //form
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    // TODO: implement goToForgetPassword
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  goToCalcul() {
    // TODO: implement goToForgetPassword
    Get.toNamed(AppRoute.calcul);
  }
}
