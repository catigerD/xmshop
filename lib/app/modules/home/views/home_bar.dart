import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class HomeBar extends StatelessWidget {
  HomeBar({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).padding.top,
            color: stateColor,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
              color: stateColor,
            ),
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
                                  child: const Text("手机"))),
                          const Icon(
                            Icons.qr_code_scanner_rounded,
                            size: 24,
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
          )
        ],
      );
    });
  }

  Color get stateColor {
    return HomeBarState.float == controller.homeBarState.value
        ? Colors.transparent
        : Colors.white;
  }
}
