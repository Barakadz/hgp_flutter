import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    //start services
    sharedPreferences = await SharedPreferences.getInstance();
    //end services
    return this;
  }
}
