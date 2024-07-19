import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/toolbar/product_toolbar_controller.dart';
import 'package:xmshop/app/widget/search_app_bar.dart';

class ProductToolbarView extends GetView<ProductToolbarController>
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(SearchAppBar.height);

  const ProductToolbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SearchAppBar(
        enable: false,
        hintText: controller.hintText.value,
        leadBuilder: (context) {
          return InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(right: 12),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
            ),
          );
        },
      );
    });
  }
}
