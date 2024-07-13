import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/toolbar/product_toolbar_controller.dart';
import 'package:xmshop/app/widget/search_toolbar.dart';

class ProductToolbarView extends GetView<ProductToolbarController>
    implements PreferredSizeWidget {
  static const _height = 80.0;
  static final _arrowColor = Color(int.parse("0xff383838"));

  @override
  Size get preferredSize => const Size.fromHeight(_height);

  const ProductToolbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
          left: 24, top: MediaQuery.of(context).padding.top, right: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 24,
                color: _arrowColor,
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
              flex: 1,
              child: Obx(() {
                return SearchToolbar(title: controller.searchText.value);
              }))
        ],
      ),
    );
  }
}
