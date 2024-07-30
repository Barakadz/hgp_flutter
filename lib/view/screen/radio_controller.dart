import 'package:get/get.dart';

class RadioController extends GetxController {
  String _orderType = 'home_delivry';
  String get orderType => _orderType;
  void setOrderType(String type) {
    _orderType = type;
    print("The order type is" + orderType);
    update();
  }
}
