import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../cart/views/cart_view.dart';
import '../../category/views/category_view.dart';
import '../../give/views/give_view.dart';
import '../../home/views/home_view.dart';
import '../../user/views/user_view.dart';

class TabsController extends GetxController {
  static const _initIndex = 1;

  final curIndex = _initIndex.obs;

  final pages = const [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView()
  ];

  final pageController = PageController(initialPage: _initIndex);

  void setCurIndex(int index) {
    curIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
