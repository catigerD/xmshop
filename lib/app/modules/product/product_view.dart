import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/product_controller.dart';
import 'package:xmshop/app/modules/product/toolbar/product_toolbar_view.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProductToolbarView(),
      body: Container(),
    );
  }
}
