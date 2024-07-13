import 'dart:math';

import 'package:get/get.dart';

class CategoryController extends GetxController {
  final tabPid = "".obs;

  void selectTab(String pid) {
    tabPid.value = pid;
  }
}
