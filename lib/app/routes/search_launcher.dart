import 'package:get/get.dart';
import 'package:xmshop/app/routes/app_pages.dart';

sealed class SearchLauncher {
  static const _keyLauncher = "launcher";

  static SearchLauncher get launcher {
    return Get.arguments[_keyLauncher];
  }

  void to() {
    Get.toNamed(Routes.SEARCH, arguments: {_keyLauncher: this});
  }
}

class DefaultSearchLauncher extends SearchLauncher {}