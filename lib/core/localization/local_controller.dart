import 'dart:ui';

import 'package:hgp/core/services/services.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  //langcode ==>code of language
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    //updateLocale ===> function tekhalik change les langues of application
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "fr") {
      language = const Locale("fr");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    // TODO: implement onInit
    super.onInit();
  }
}
