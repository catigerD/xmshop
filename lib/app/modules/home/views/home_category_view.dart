import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_category_controller.dart';

class HomeCategoryView extends GetView<HomeCategoryController> {
  final int crossAxisCount;
  final int mainAxisCount;

  int get _pageCount {
    return crossAxisCount * mainAxisCount;
  }

  const HomeCategoryView(
      {super.key, this.crossAxisCount = 5, this.mainAxisCount = 2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Obx(() {
        return Swiper(
          index: 0,
          itemCount: (controller.itemList.length / _pageCount).ceil(),
          itemBuilder: (context, swiperIndex) {
            return GridView.builder(
              itemCount: min(
                  controller.itemList.length - swiperIndex * _pageCount,
                  _pageCount),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, mainAxisSpacing: 12),
              itemBuilder: (context, gridIndex) {
                return _genItem(context,
                    controller.itemList[swiperIndex * _pageCount + gridIndex]);
              },
            );
          },
          pagination: const SwiperPagination(),
        );
      }),
    );
  }

  Widget _genItem(BuildContext context, HomeCategoryItemVO vo) {
    return Column(
      children: [
        Image.network(
          vo.iconUrl,
          width: 50,
          height: 50,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            vo.title,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
