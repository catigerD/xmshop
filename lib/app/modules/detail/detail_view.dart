import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/detail/appbar/detail_appbar_controller.dart';
import 'package:xmshop/app/modules/detail/appbar/detail_appbar_view.dart';
import 'package:xmshop/app/modules/detail/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  DetailView({super.key});

  final appbarController = Get.find<DetailAppbarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const DetailAppbarView(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            Container(
              key: appbarController.tabList.value[0].globalKey,
              height: 800,
              color: Colors.red.withOpacity(0.2),
            ),
            Container(
              key: appbarController.tabList.value[1].globalKey,
              height: 1000,
              color: Colors.blue,
            ),
            Container(
              key: appbarController.tabList.value[2].globalKey,
              height: 1500,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
