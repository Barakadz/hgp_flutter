import 'package:hgp/bindings/initialbindings.dart';
import 'package:hgp/controller/auth/calcul_controller.dart';
import 'package:hgp/core/localization/local.dart';
import 'package:hgp/core/localization/local_controller.dart';
import 'package:hgp/core/services/services.dart';
import 'package:hgp/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hgp/core/constant/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
  Get.put(CalculControllerImp);
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return GetMaterialApp(
      title: 'HASNAOUI GYPSUM PANEL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
              displayLarge:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              displayMedium:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              bodyLarge: TextStyle(color: AppColor.greyy, fontSize: 13)),
          primarySwatch: Colors.blue),
      locale: controller.language,
      translations: MyLocale(),
      initialBinding: InitialBindings(),
      //home: OnBoarding(),
      //nkhalihe yebda onording mel routes
      //routes: routes,
      getPages: routes,
    );
  }
}
