import 'package:hgp/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//kol page lazem ykon laha controller page login 3andha controller , page signup 3andeha controller ...
abstract class VerifyCodeController extends GetxController {
  checkCode();
  //tedini reset password page
  goToResetPassword();
}

//lazem na7e9eneha fel page login
class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifycode;
  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  goToSignUp() {
    // TODO: implement goToSignUp
    throw UnimplementedError();
  }
}
