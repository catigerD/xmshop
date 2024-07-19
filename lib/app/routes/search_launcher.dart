import 'package:get/get.dart';
import 'package:xmshop/app/routes/app_pages.dart';

sealed class SearchLauncher {
  void to() {
    Get.toNamed(Routes.SEARCH);
  }
}

class DefaultSearchLauncher extends SearchLauncher {}
