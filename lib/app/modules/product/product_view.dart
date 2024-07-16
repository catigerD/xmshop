import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/filter/product_filter_view.dart';
import 'package:xmshop/app/modules/product/list/product_list_view.dart';
import 'package:xmshop/app/modules/product/product_controller.dart';
import 'package:xmshop/app/modules/product/toolbar/product_toolbar_view.dart';

class ProductView extends GetView<ProductController> {
  static final bodyColor = Color(int.parse("0xfff4f4f4"));

  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProductToolbarView(),
      body: Container(
        color: bodyColor,
        child: const Column(children: [
          ProductFilterView(),
          Expanded(child: ProductListView())
        ]),
      ),
    );
  }
}
