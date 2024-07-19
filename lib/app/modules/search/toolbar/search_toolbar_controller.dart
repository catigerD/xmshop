import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchToolbarController extends GetxController {
  final hintText = "搜索商品";
  final submitText = "搜索";

  final textController = TextEditingController();

  void resetKeyword([String? keyword]) {
    textController.text = keyword ?? "";
  }
}
