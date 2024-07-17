import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/widget/search_app_bar.dart';

class SearchView extends GetView<SearchController> {
  final TextEditingController textController = TextEditingController();

  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        enable: true,
        controller: textController,
        hintText: "搜索商品",
      ),
      body: const Center(),
    );
  }
}
