import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const homeBarStateOffsetThreshold = 30;

  final scrollController = ScrollController();

  var homeBarState = HomeBarState.float.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_changeHomeBarState);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _changeHomeBarState() {
    if (scrollController.offset > homeBarStateOffsetThreshold) {
      if (homeBarState.value != HomeBarState.fix) {
        homeBarState.value = HomeBarState.fix;
        update();
      }
    } else {
      if (homeBarState.value != HomeBarState.float) {
        homeBarState.value = HomeBarState.float;
        update();
      }
    }
  }
}

enum HomeBarState { float, fix }
