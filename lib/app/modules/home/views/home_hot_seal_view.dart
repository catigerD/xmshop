import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/circular_reveal_clipper.dart';
import 'package:xmshop/app/modules/home/controllers/home_hot_seal_controller.dart';

class HomeHotSealView extends GetView<HomeHotSealController> {
  const HomeHotSealView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(children: [_header(context), _body(context)]),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              controller.header.value.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              controller.header.value.subTitle,
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        );
      }),
    );
  }

  Widget _body(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _bannerList(context),
          const Padding(padding: EdgeInsets.only(right: 8)),
          Expanded(flex: 1, child: _commodityList(context))
        ],
      ),
    );
  }

  Widget _bannerList(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: 160,
        height: 160 * 734 / 502,
        child: controller.bannerList.isEmpty
            ? const Icon(
                Icons.cloud_download,
                size: 50,
              )
            : Swiper(
                itemCount: controller.bannerList.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      controller.bannerList[index].pic,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                pagination: const SwiperPagination(),
              ),
      );
    });
  }

  Widget _commodityList(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: controller.commodityList.map((e) {
          return _commodityItem(context, e);
        }).toList(),
      );
    });
  }

  Widget _commodityItem(BuildContext context, HomeHotSealCommodityVO vo) {
    return Container(
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 8),
      decoration: BoxDecoration(
          color: Color(int.parse("0xfff8f8f8")),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vo.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  vo.subTitle,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  vo.price,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Image.network(
              vo.pic,
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            ),
          )
        ],
      ),
    );
  }
}
