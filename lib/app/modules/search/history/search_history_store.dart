import 'package:xmshop/util/KVStore.dart';

class SearchHistoryStore {
  _SearchHistoryStore() {}

  static const String _historyKey = "key_search_history";

  static Future<List<String>> historyList() async {
    return await KVStore.get(_historyKey, <String>[]) ?? [];
  }

  static Future<bool> addHistory(String title) async {
    final allHistory = await historyList();
    if (allHistory.contains(title)) {
      return false;
    }

    allHistory.add(title);
    return await KVStore.put(_historyKey, allHistory);
  }

  static Future<bool> deleteHistory(String title) async {
    final allHistory = await historyList();
    if (!allHistory.contains(title)) {
      return false;
    }

    allHistory.remove(title);
    return await KVStore.put(_historyKey, allHistory);
  }

  static Future<bool> clearHistory() async {
    return KVStore.clear(_historyKey);
  }
}
