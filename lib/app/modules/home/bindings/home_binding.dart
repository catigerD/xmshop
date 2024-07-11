import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_banner_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_bar_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_hot_seal_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_category_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_hint_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<HomeToolbarController>(() => HomeToolbarController());
    Get.lazyPut<HomeBannerController>(() => HomeBannerController());
    Get.lazyPut<HomeHintController>(() => HomeHintController());
    Get.lazyPut<HomeCategoryController>(() => HomeCategoryController());
    Get.lazyPut<HomeHotSealController>(() => HomeHotSealController());
  }
}
