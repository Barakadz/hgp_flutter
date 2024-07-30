import 'package:hgp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//kol page lazem ykon laha controller page login 3andha controller , page signup 3andeha controller ...
abstract class RessetPasswordController extends GetxController {
  resetpassword();
  //tedini forget password page
  goToSuccessResetPassword();
}

//lazem na7e9eneha fel page login
class RessetPasswordControllerImp extends RessetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.successResetpassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }

  @override
  goToSignUp() {
    // TODO: implement goToSignUp
    throw UnimplementedError();
  }
}
