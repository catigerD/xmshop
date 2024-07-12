import 'dart:math';

import 'package:get/get.dart';

class CategoryController extends GetxController {
  final curPid = "".obs;

  void select(String pid) {
    curPid.value = pid;
  }
}
