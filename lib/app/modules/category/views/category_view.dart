import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/views/category_sub_view.dart';
import 'package:xmshop/app/modules/category/views/category_tab_view.dart';
import 'package:xmshop/app/modules/category/views/category_toolbar_view.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CategoryToolbarView(),
      body: Container(
        padding: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Expanded(flex: 1, child: CategoryTabView()),
            Expanded(
                flex: 3,
                child: Obx(() {
                  return CategorySubView(tabPid: controller.tabPid.value);
                }))
          ],
        ),
      ),
    );
  }
}
