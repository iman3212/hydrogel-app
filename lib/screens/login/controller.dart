import 'package:get/get.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/storage/shared-preferences.dart';
import 'package:hydrogel/exports/ex-network.dart';

class LoginController extends GetxController {

  ExceptionAlert alertDialog = ExceptionAlert();

  var processing = false.obs;

  var obscureText = true.obs;

  void obscure() {
    obscureText.value = !obscureText.value;
  }

  Future<void> loginTokenRequest(String username, String password) async {
    try {
      processing.value = true;
      final response = await NetworkService().post(
          "account/api/login", {"username": username, "password": password},
          type: RequestType.LOGIN);

      if (response != null && response.statusCode == 200) {
        await TokenService.saveToken(response.data["Token"] as String);
        await TokenService.saveUserInfo(username, DateTime.now()); 
        if (response.data["Token"] != null) {
          Get.offNamed(Routes.onboarding);
        }
      } else {
        // Likely responce is null !
      }
    } catch (e) {
      if (e is DioException) {
        NetworkService().checkException(e, RequestType.LOGIN);
        print(e.toString());
      } else {
        alertDialog.showAlert(
            context: Get.context!,
            title: 'Error',
            content: "An unexpected error occurred. Please try again later.",);
        print(e.toString());
      }
    } finally {
      processing.value = false;
    }
  }
}
