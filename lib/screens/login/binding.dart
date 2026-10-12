import 'package:get/get.dart';
import 'package:hydrogel/screens/login/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
