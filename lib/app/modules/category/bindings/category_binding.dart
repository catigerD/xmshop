import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/controllers/category_tab_controller.dart';
import 'package:xmshop/app/modules/category/controllers/category_toolbar_controller.dart';

import '../controllers/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<CategoryToolbarController>(() => CategoryToolbarController());
    Get.lazyPut<CategoryTabController>(() => CategoryTabController());
  }
}
