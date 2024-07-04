import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_banner_controller.dart';

class HomeBanner extends GetView<HomeBannerController> {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 228,
      child: Obx(() {
        if (controller.imgUrlList.isEmpty) {
          return Center(
              child: Text(
            "加载中!!!",
            style: Theme.of(context).textTheme.titleLarge,
          ));
        }

        return Swiper(
          index: 0,
          itemCount: controller.imgUrlList.length,
          itemBuilder: (context, index) {
            return Image.network(
              controller.imgUrlList[index],
              fit: BoxFit.cover,
            );
          },
          pagination: const SwiperPagination(),
        );
      }),
    );
  }
}
