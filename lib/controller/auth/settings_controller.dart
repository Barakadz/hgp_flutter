import 'package:get/get.dart';
import 'package:hgp/core/constant/routes.dart';
import 'package:hgp/core/services/services.dart';

class SettingsController extends GetxController {
  var isExpanded = false.obs;
  var isExpandedTwo = false.obs;
  var isExpandedThree = false.obs;

  MyServices myServices = Get.find();
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed("/");
  }

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }

  void toggleExpansionTwo() {
    isExpandedTwo.value = !isExpanded.value;
  }

  void toggleExpansionThree() {
    isExpandedThree.value = !isExpanded.value;
  }
}
