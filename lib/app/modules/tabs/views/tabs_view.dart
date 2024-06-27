import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Center(
          child: PageView(
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index) {
              controller.setCurIndex(index);
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.curIndex.value,
          onTap: (index) {
            controller.setCurIndex(index);
            controller.pageController.jumpToPage(index);
          },
          fixedColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
            BottomNavigationBarItem(
                icon: Icon(Icons.room_service), label: "服务"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "购物车"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "用户"),
          ],
        ),
      );
    });
  }
}
