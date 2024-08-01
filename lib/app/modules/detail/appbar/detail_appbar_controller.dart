import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/detail/detail_controller.dart';

class DetailAppbarController extends GetxController {
  static const _appbarScrollThreshold = 100;

  final tabList = [
    DetailAppbarTabItemVO(title: "商品", selected: true, globalKey: GlobalKey()),
    DetailAppbarTabItemVO(title: "详情", selected: false, globalKey: GlobalKey()),
    DetailAppbarTabItemVO(title: "推荐", selected: false, globalKey: GlobalKey())
  ].obs;

  final uiState =
      (DetailAppbarFullState(tabOpacity: 0.0) as DetailAppbarUIState).obs;
  late final rootController = Get.find<DetailController>();

  @override
  void onInit() {
    rootController.scrollController.addListener(_listenScroll);
    super.onInit();
  }

  void _listenScroll() {
    if (rootController.scrollController.position.pixels >
        _appbarScrollThreshold) {
      uiState.value = DetailAppbarTabState();
    } else {
      uiState.value = DetailAppbarFullState(
          tabOpacity: rootController.scrollController.position.pixels /
              _appbarScrollThreshold);
    }
  }

  void changeTab(DetailAppbarTabItemVO selectedVO) {
    final newList = tabList.value.map((e) {
      if (e.title != selectedVO.title) {
        return e.copyWith(selected: false);
      }
      return e.copyWith(selected: true);
    }).toList();
    tabList.value = newList;

    Scrollable.ensureVisible(selectedVO.globalKey.currentContext as BuildContext);
  }
}

class DetailAppbarTabItemVO {
  final String title;
  final bool selected;
  final GlobalKey globalKey;

  const DetailAppbarTabItemVO(
      {required this.title, required this.selected, required this.globalKey});

  DetailAppbarTabItemVO copyWith({
    bool? selected,
  }) {
    return DetailAppbarTabItemVO(
        title: title,
        selected: selected ?? this.selected,
        globalKey: globalKey);
  }
}

sealed class DetailAppbarUIState {}

class DetailAppbarFullState extends DetailAppbarUIState {
  final double tabOpacity;

  DetailAppbarFullState({
    required this.tabOpacity,
  });
}

class DetailAppbarTabState extends DetailAppbarUIState {}
