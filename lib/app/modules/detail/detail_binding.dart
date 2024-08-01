import 'package:get/get.dart';
import 'package:xmshop/app/modules/detail/appbar/detail_appbar_controller.dart';
import 'package:xmshop/app/modules/detail/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
    Get.lazyPut<DetailAppbarController>(() => DetailAppbarController());
  }
}
