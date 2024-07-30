import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = 'mur plein'.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
