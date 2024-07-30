import 'package:get/get.dart';

class DropDownMenu extends GetxController {
  var selectedValue = 'm'.obs;

  get selectedOption => null;
  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
