import 'package:get/get.dart';
import 'package:hydrogel/routes/routes.dart';
import 'package:hydrogel/services/model/history_model.dart';
import 'package:hydrogel/services/network.dart';
import 'package:hydrogel/storage/shared-preferences.dart';

class MenuPageController extends GetxController {
  RxString username = ''.obs;
  Rx<DateTime?> loginDate = Rx<DateTime?>(null);
  Rx<bool> isFetchingData = false.obs;
  RxList<QcResults> qcInformation = <QcResults>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
    qcHistory();
  }

  Future<void> fetchUserInfo() async {
    final userInfo = await TokenService.getUserInfo();
    if (userInfo != null) {
      username.value = userInfo['username'] ?? '';
      loginDate.value = userInfo['login_date'] ?? '';
    }
  }


  Future<void> logOut() async {
    await TokenService.removeToken();
    Get.offNamed(Routes.login);
  }

  Future<void> qcHistory() async {
    try {
      if (isFetchingData.value) {
        return;
      }
      isFetchingData.value = true;
      final response =
          await NetworkService().get("history/api/quality/history/list?page=1");
      if (response?.statusCode == 200 && response != null) {
        final data = QcHistoryParsing.fromJson(response.data);
        final newItems = data.results;
        qcInformation.addAll(newItems);
        update();
      }
    } catch (e) {
      print(e);
    } finally {
      isFetchingData.value = false;
    }
  }
}
