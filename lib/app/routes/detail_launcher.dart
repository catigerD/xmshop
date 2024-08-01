import 'package:get/get.dart';
import 'package:xmshop/app/routes/app_pages.dart';

sealed class DetailLauncher {
  static const _keyLauncher = "launcher";

  static DetailLauncher get launcher {
    return Get.arguments[_keyLauncher];
  }

  void to() {
    Get.toNamed(Routes.DETAIL, arguments: {_keyLauncher: this});
  }
}

class DefaultDetailLauncher extends DetailLauncher {}
