import 'package:get/get.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/storage/shared-preferences.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    navigation();
    super.onReady();
  }

  Future<void> navigation() async {
    try {
      String? tokenRead = await TokenService.getToken();
      await Future.delayed(const Duration(seconds: 3));
      if (tokenRead == null) {
        Get.offNamed(Routes.login);
      } else {
        Get.offNamed(Routes.menu);
      }
    } catch (e) {
    }
  }
}
