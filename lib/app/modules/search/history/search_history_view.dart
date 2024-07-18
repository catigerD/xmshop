import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/history/search_history_controller.dart';

class SearchHistoryView extends GetView<SearchHistoryController> {
  const SearchHistoryView({super.key});

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
        const Icon(
          Icons.delete,
          size: 20,
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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
      child: Text(
        vo.title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
