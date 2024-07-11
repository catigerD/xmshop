import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_best_seal_controller.dart';

class HomeBestSealView extends GetView<HomeBestSealController> {
  const HomeBestSealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(context),
        _body(context),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              controller.headerVO.value.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              controller.headerVO.value.subtitle,
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
      );
    });
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Obx(() {
        return MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          mainAxisSpacing: 9,
          crossAxisSpacing: 9,
          itemCount: controller.commodityVOList.length,
          itemBuilder: (context, index) {
            return _commodityItem(context, controller.commodityVOList[index]);
          },
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        );
      }),
    );
  }

  Widget _commodityItem(BuildContext context, HomeBestSealCommodityVO vo) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(int.parse("0xfff8f8f8")),
      ),
      child: Column(
        children: [
          Image.network(vo.pic),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              vo.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              vo.subTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              vo.price,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}
