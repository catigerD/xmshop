import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/views/home_banner_view.dart';
import 'package:xmshop/app/modules/home/views/home_category_view.dart';
import 'package:xmshop/app/modules/home/views/home_toolbar_view.dart';
import 'package:xmshop/app/modules/home/views/home_hint_view.dart';

import '../../../services/keep_alive_wrapper.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      keepAlive: true,
      child: Scaffold(
          body: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              controller: controller.scrollController,
              children: const [
                HomeBannerView(),
                HomeHintView(),
                HomeCategoryView()
              ],
            ),
          ),
        ),
        Positioned(left: 0, right: 0, top: 0, child: HomeToolbarView()),
      ])),
    );
  }
}
