import 'package:get/get.dart';
import 'package:xmshop/app/routes/app_pages.dart';

sealed class ProductLauncher {
  static const _keyLauncher = "launcher";

  static ProductLauncher get launcher {
    return Get.arguments[_keyLauncher];
  }

  void offAndTo() {
    Get.offAndToNamed(Routes.PRODUCT, arguments: {_keyLauncher: this});
  }

  void to() {
    Get.toNamed(Routes.PRODUCT, arguments: {_keyLauncher: this});
  }
}

class ProductKeywordLauncher extends ProductLauncher {
  final String keyword;

  ProductKeywordLauncher({
    required this.keyword,
  });
}

class ProductCategoryLauncher extends ProductLauncher {
  final String pid;
  final String title;

  ProductCategoryLauncher({required this.pid, required this.title});
}
