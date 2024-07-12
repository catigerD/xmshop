import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/controllers/category_toolbar_controller.dart';

class CategoryToolbarView extends GetView<CategoryToolbarController>
    implements PreferredSizeWidget {
  final double statusbarHeight;

  const CategoryToolbarView({super.key, required this.statusbarHeight});

  static const double toolbarHeight = 40;

  static final Color _searchBgColor = Color(int.parse("0xfff7f7f7"));
  static final Color _searchHintColor = Color(int.parse("0xffa8a8a8"));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          SizedBox(
            height: statusbarHeight,
          ),
          _toolbar(context)
        ],
      ),
    );
  }

  Widget _toolbar(BuildContext context) {
    return SizedBox(
      height: toolbarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(flex: 1, child: _search(context)),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.message,
                size: 20,
                color: Colors.black,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _search(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.only(left: 12, right: 12),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: _searchBgColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: _searchHintColor,
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Obx(() {
            return Text(
              controller.searchText.value,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: _searchHintColor),
            );
          }),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight + statusbarHeight);
}
