import 'package:get/get.dart';

class SearchHistoryController extends GetxController {
  final title = "搜索历史";

  final itemList = <SearchHistoryItemVO>[].obs;

  @override
  void onInit() {
    _initList();
    super.onInit();
  }

  void _initList() {
    itemList.value = <String>[
      "红米",
      "手机壳",
      "电视",
      "红米",
      "手机壳",
      "电视",
      "红米",
      "手机壳",
      "电视"
    ].map((e) => SearchHistoryItemVO(title: e)).toList();
  }
}

class SearchHistoryItemVO {
  final String title;

  const SearchHistoryItemVO({
    required this.title,
  });
}
