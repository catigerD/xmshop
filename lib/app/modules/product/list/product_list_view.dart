import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/list/product_list_controller.dart';
import 'package:xmshop/app/widget/async/async_empty_view.dart';
import 'package:xmshop/app/widget/async/async_loading_view.dart';
import 'package:xmshop/app/widget/async/async_view.dart';
import 'package:xmshop/app/widget/async/async_vo.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AsyncView(
          state: controller.asyncVO.value.state,
          contentBuilder: (context) => _list());
    });
  }

  Widget _list() {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Obx(() {
        return ListView.separated(
          controller: controller.scrollController,
          itemCount:
              (controller.asyncVO.value as ProductListVO).content.length + 1,
          itemBuilder: (context, index) {
            return Obx(() {
              if (index ==
                  (controller.asyncVO.value as ProductListVO).content.length) {
                return _footer(context);
              }

              return _item(context,
                  (controller.asyncVO.value as ProductListVO).content[index]);
            });
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
        );
      }),
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

  Widget _footer(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 60,
        child: controller.hasMore.value
            ? const AsyncLoadingView()
            : const AsyncEmptyView(),
      );
    });
  }
}
