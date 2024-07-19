import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/history/search_history_view.dart';
import 'package:xmshop/app/modules/search/toolbar/search_toolbar_view.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: SearchToolbarView(),
      body: Column(
        children: [SearchHistoryView()],
      ),
    );
  }
}
