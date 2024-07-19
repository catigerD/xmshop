import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/history/search_history_controller.dart';
import 'package:xmshop/app/modules/search/history/search_history_store.dart';
import 'package:xmshop/app/modules/search/toolbar/search_toolbar_controller.dart';

class SearchHistoryView extends GetView<SearchHistoryController> {
  SearchHistoryView({super.key});

  late final toolbarController = Get.find<SearchToolbarController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          _title(context),
          const SizedBox(
            height: 12,
          ),
          _list(context)
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          controller.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        InkWell(
          onTap: () async {
            final isDelete = await showDeleteConfirmDialog(context) ?? false;
            if (isDelete) {
              final result = await SearchHistoryStore.clearHistory();
              if (result) {
                controller.load();
                Fluttertoast.showToast(msg: "删除成功");
              } else {
                Fluttertoast.showToast(msg: "删除失败");
              }
            }
          },
          child: const Icon(
            Icons.delete,
            size: 20,
          ),
        )
      ],
    );
  }

  Widget _list(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Obx(() {
        return Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 12,
          runSpacing: 8,
          children: controller.itemList.map((e) => _item(context, e)).toList(),
        );
      }),
    );
  }

  Widget _item(BuildContext context, SearchHistoryItemVO vo) {
    return InkWell(
      onTap: () {
        toolbarController.resetKeyword(vo.title);
      },
      onLongPress: () async {
        final isDelete = await showDeleteConfirmDialog(context) ?? false;
        if (isDelete) {
          final result = await SearchHistoryStore.deleteHistory(vo.title);
          if (result) {
            controller.load();
            Fluttertoast.showToast(msg: "删除成功");
          } else {
            Fluttertoast.showToast(msg: "删除失败");
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
        child: Text(
          vo.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  Future<bool?> showDeleteConfirmDialog(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示？"),
            content: const Text("您确定要删除吗?"),
            actions: [
              TextButton(
                child: const Text("取消"),
                onPressed: () => Navigator.of(context).pop(false), // 关闭对话框
              ),
              TextButton(
                child: const Text("删除"),
                onPressed: () {
                  //关闭对话框并返回true
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }
}
