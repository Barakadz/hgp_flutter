import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hgp/core/constant/routes.dart';

class MyMiddleWare extends GetMiddleware {
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("onbording") == "1") {
      return const RouteSettings(name: AppRoute.home);
    }
  }
}
