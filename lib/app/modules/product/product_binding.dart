import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/filter/product_filter_controller.dart';
import 'package:xmshop/app/modules/product/list/product_list_controller.dart';
import 'package:xmshop/app/modules/product/product_controller.dart';
import 'package:xmshop/app/modules/product/toolbar/product_toolbar_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<ProductToolbarController>(() => ProductToolbarController());
    Get.lazyPut<ProductListController>(() => ProductListController());
    Get.lazyPut<ProductFilterController>(() => ProductFilterController());
  }
}
