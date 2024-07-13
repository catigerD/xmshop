import 'package:get/get.dart';

class ProductToolbarController extends GetxController {
  final searchText = "".obs;

  @override
  void onInit() {
    searchText.value = Get.arguments?["title"] ?? "";
    super.onInit();
  }
}
