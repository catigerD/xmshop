import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/list/product_list_controller.dart';
import 'package:xmshop/app/widget/circular_loading.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.productList.isEmpty ? const CircularLoading() : _list();
    });
  }

  Widget _list() {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: ListView.separated(
        itemCount: controller.productList.length,
        itemBuilder: (context, index) {
          return Obx(() {
            return _item(context, controller.productList[index]);
          });
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }

  Widget _item(BuildContext context, ProductItemVO vo) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      padding: const EdgeInsets.only(left: 12, top: 16, right: 12, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Image.network(
                vo.pic,
                fit: BoxFit.fitHeight,
              )),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vo.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  vo.subTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  vo.price,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}