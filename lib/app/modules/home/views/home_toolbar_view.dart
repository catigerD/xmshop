import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_bar_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class HomeToolbarView extends GetView<HomeToolbarController> {
  HomeToolbarView({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppBar(
        backgroundColor: stateColor,
        toolbarHeight: 40,
        title: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          child: Row(
            children: [
              const Icon(
                Icons.person,
                size: 24,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 32,
                    margin: const EdgeInsets.only(left: 12),
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    decoration: BoxDecoration(
                        color: Color(int.parse("0xfffcf4ec")),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          size: 24,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                                margin:
                                    const EdgeInsets.only(left: 4, right: 4),
                                child: Text(
                                  "手机",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ))),
                        const Icon(
                          Icons.qr_code_scanner_rounded,
                        ),
                      ],
                    ),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: const Icon(
                  Icons.qr_code,
                  size: 24,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: const Icon(
                  Icons.message,
                  size: 24,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Color get stateColor {
    return HomeBarState.float == homeController.homeBarState.value
        ? Colors.transparent
        : Colors.white;
  }
}
