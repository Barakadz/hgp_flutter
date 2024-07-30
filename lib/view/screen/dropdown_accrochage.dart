import 'package:get/get.dart';

class DropDownAccrochage extends GetxController {
  var selectedValue = 'meuble cuisine'.obs;
  void setSelectedValue(String value) {
    selectedValue.value = value;
  }
}
