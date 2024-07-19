import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/history/search_history_store.dart';
import 'package:xmshop/util/KVStore.dart';
import 'package:xmshop/util/LogManager.dart';

class SearchHistoryController extends GetxController {
  final title = "搜索历史";

  final itemList = <SearchHistoryItemVO>[].obs;

  @override
  void onInit() {
    load();
    super.onInit();
  }

  void load() async {
    final historyList = await SearchHistoryStore.historyList();
    itemList.value =
        historyList.map((e) => SearchHistoryItemVO(title: e)).toList() ?? [];
  }
}

class SearchHistoryItemVO {
  final String title;

  const SearchHistoryItemVO({
    required this.title,
  });
}
