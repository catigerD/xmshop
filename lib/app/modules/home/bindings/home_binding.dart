import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_banner_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_bar_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<HomeBarController>(() => HomeBarController());
    Get.lazyPut<HomeBannerController>(() => HomeBannerController());
  }
}
