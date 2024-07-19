import 'package:get/get.dart';
import 'package:xmshop/app/routes/product_launcher.dart';

class ProductToolbarController extends GetxController {
  final hintText = "".obs;

  @override
  void onInit() {
    _initHintText();
    super.onInit();
  }

  void _initHintText() {
    final launcher = ProductLauncher.launcher;
    if (launcher is ProductKeywordLauncher) {
      hintText.value = launcher.keyword;
    } else if (launcher is ProductCategoryLauncher) {
      hintText.value = launcher.title;
    }
  }
}
