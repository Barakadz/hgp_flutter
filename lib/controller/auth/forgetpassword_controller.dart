import 'package:hgp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//kol page lazem ykon laha controller page login 3andha controller , page signup 3andeha controller ...
abstract class ForgetPasswordController extends GetxController {
  checkemail();
  //tedini forget password page
  goToVerifyCode();
}

//lazem na7e9eneha fel page login
class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController email;

  @override
  checkemail() {}

  @override
  goToVerifyCode() {
    Get.offNamed(AppRoute.verifyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }

  @override
  goToSignUp() {
    // TODO: implement goToSignUp
    throw UnimplementedError();
  }
}
