import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hgp/core/constant/color.dart';

customSnackbar(title, message, type) {
  Get.snackbar(title, message,
      snackPosition: type == "error" ? SnackPosition.BOTTOM : SnackPosition.TOP,
      duration: Duration(seconds: 4),
      colorText: AppColor.primaryColor,
      icon: Image.asset(
        "assets/images/logo-hgp.png",
        width: 250,
      ));
}
