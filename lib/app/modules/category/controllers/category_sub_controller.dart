import 'dart:math';

import 'package:get/get.dart';
import 'package:xmshop/app/api/http_client.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/pcate_dto.dart';

class CategorySubController extends GetxController {
  final _categoryList = <CategorySubListVO>[];

  final itemList = <CategorySubItemVO>[].obs;

  String _curPid = "";

  void loadPList(String pid) async {
    if (pid.isEmpty) {
      return;
    }

    _curPid = pid;
    var voList = _categoryList.firstWhereOrNull((e) => e.pid == pid)?.itemList;
    if (voList != null) {
      itemList.value = voList;
      return;
    }

    final dtoList = await HttpClient.getList<PCateDto>(PathManager.apiPCate,
        queryParameters: {"pid": pid}, fromJsonT: PCateDto.fromJson);
    voList = dtoList?.map((e) => e.convert2VO()).toList() ?? [];

    if (_curPid == pid) {
      itemList.value = voList;
    }
  }
}

extension on PCateDto {
  CategorySubItemVO convert2VO() {
    return CategorySubItemVO(
        id: id, pic: HttpClient.handleUrl(pic), title: title);
  }
}

class CategorySubItemVO {
  final String id;
  final String pic;
  final String title;

  const CategorySubItemVO({
    required this.id,
    required this.pic,
    required this.title,
  });
}

class CategorySubListVO {
  final String pid;
  final List<CategorySubItemVO> itemList;

  const CategorySubListVO({
    required this.pid,
    required this.itemList,
  });
}
