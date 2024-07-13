import 'package:get/get.dart';
import 'package:xmshop/app/api/http_client.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/pcate_dto.dart';

class CategoryProductController extends GetxController {
  final _categoryList = <CategoryProductListVO>[];

  final itemList = <CategoryProductItemVO>[].obs;

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
  CategoryProductItemVO convert2VO() {
    return CategoryProductItemVO(pic: HttpClient.handleUrl(pic), title: title);
  }
}

class CategoryProductItemVO {
  final String pic;
  final String title;

  const CategoryProductItemVO({
    required this.pic,
    required this.title,
  });
}

class CategoryProductListVO {
  final String pid;
  final List<CategoryProductItemVO> itemList;

  const CategoryProductListVO({
    required this.pid,
    required this.itemList,
  });
}
