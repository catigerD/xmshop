import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmshop/app/modules/category/bindings/category_binding.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';
import 'package:xmshop/app/modules/give/controllers/give_controller.dart';
import 'package:xmshop/app/modules/home/bindings/home_binding.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/modules/user/controllers/user_controller.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    HomeBinding().dependencies();
    CategoryBinding().dependencies();
    Get.lazyPut<GiveController>(() => GiveController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
