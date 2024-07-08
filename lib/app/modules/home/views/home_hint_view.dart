import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_hint_controller.dart';

class HomeHintView extends GetView<HomeHintController> {
  const HomeHintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 9, bottom: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
              controller.hintList.map((e) => _genItem(context, e)).toList(),
        ),
      );
    });
  }

  Widget _genItem(BuildContext context, HomeHintItemVO vo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          vo.iconData,
          size: 12,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4),
          child: Text(
            vo.title,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        )
      ],
    );
  }
}
