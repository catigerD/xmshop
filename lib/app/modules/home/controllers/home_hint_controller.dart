import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHintController extends GetxController {
  final hintList = <HomeHintItemVO>[].obs;

  @override
  void onInit() {
    hintList.value = [
      HomeHintItemVO("官方商城", Icons.shop),
      HomeHintItemVO("售后无忧", Icons.security),
      HomeHintItemVO("资质证明", Icons.verified)
    ];
    super.onInit();
  }
}

class HomeHintItemVO {
  final String title;
  final IconData iconData;

  HomeHintItemVO(this.title, this.iconData);
}
