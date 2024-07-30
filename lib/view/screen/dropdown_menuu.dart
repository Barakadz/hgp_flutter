import 'package:get/get.dart';

class DropDownMenuu extends GetxController {
  var selectedValue = 'm'.obs;

  get selectedOption => null;
  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
