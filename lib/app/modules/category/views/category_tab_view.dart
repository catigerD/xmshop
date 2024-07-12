import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';
import 'package:xmshop/app/modules/category/controllers/category_tab_controller.dart';

class CategoryTabView extends GetView<CategoryTabController> {
  CategoryTabView({super.key});

  static final Color indicatorColor = Color(int.parse("0xfffd6f06"));

  final parentController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.separated(
        itemCount: controller.tabList.length,
        itemBuilder: (context, index) {
          return _tabItem(context, index);
        },
        separatorBuilder: (context, index) {
          return _separatorItem(context, index);
        },
      );
    });
  }

  Widget _tabItem(BuildContext context, int index) {
    return Obx(() {
      return InkWell(
        onTap: () {
          controller.select(index);
          parentController.select(controller.tabList[index].pid);
        },
        child: IntrinsicHeight(
          child: Row(
            children: [
              Visibility(
                visible: controller.selectedIndex.value == index,
                child: Container(
                  width: 2,
                  decoration: BoxDecoration(color: indicatorColor),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  controller.tabList[index].title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ))
            ],
          ),
        ),
      );
    });
  }

  Widget _separatorItem(BuildContext context, int index) {
    return const SizedBox(
      height: 36,
      width: double.infinity,
    );
  }
}
