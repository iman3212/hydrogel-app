import 'package:get/get.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/services/network.dart';

class GcodeController extends GetxController {
  Future<void> gcode(file) async {
    try {
      final response = await NetworkService().post("send/g-code", file);
      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        final resultId = response.data[""];
        if (resultId != null) {
          Get.toNamed(Routes.configration, arguments: resultId);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
