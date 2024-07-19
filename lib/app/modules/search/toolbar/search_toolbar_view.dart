import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/history/search_history_controller.dart';
import 'package:xmshop/app/modules/search/history/search_history_store.dart';
import 'package:xmshop/app/modules/search/toolbar/search_toolbar_controller.dart';
import 'package:xmshop/app/routes/product_launcher.dart';
import 'package:xmshop/app/widget/search_app_bar.dart';

class SearchToolbarView extends GetView<SearchToolbarController>
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(SearchAppBar.height);

  late final SearchHistoryController _historyController =
      Get.find<SearchHistoryController>();

  SearchToolbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAppBar(
      enable: true,
      autofocus: true,
      hintText: controller.hintText,
      controller: controller.textController,
      onSubmitted: (s) {
        _toProduct();
      },
      leadBuilder: (context) {
        return InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 12),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
          ),
        );
      },
      tailBuilder: (context) {
        return InkWell(
          onTap: () {
            _toProduct();
          },
          child: Container(
            padding: const EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              controller.submitText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }

  void _toProduct() {
    SearchHistoryStore.addHistory(controller.textController.text);
    ProductKeywordLauncher(keyword: controller.textController.text).offAndTo();
  }
}
