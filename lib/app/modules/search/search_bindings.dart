import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/history/search_history_controller.dart';
import 'package:xmshop/app/modules/search/toolbar/search_toolbar_controller.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<SearchToolbarController>(() => SearchToolbarController());
    Get.lazyPut<SearchHistoryController>(() => SearchHistoryController());
  }
}
