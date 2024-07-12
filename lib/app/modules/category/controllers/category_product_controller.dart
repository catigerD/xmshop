import 'package:get/get.dart';
import 'package:xmshop/app/api/dio_manager.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/api/url_manager.dart';
import 'package:xmshop/app/model/home_pcate_dto.dart';
import 'package:xmshop/app/model/response_dto.dart';

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

    final response =
        await dio.get(PathManager.apiPCate, queryParameters: {"pid": pid});
    List<HomePcateDto>? dtoList;
    try {
      dtoList = ResponseDto<List<HomePcateDto>>.fromJson(response.data, (json) {
        return (json as List).map((e) => HomePcateDto.fromJson(e)).toList();
      }).result;
    } catch (e) {
      dtoList = null;
    }

    voList = dtoList?.map((e) => e.convert2VO()).toList() ?? [];

    if (_curPid == pid) {
      itemList.value = voList;
    }
  }
}

extension on HomePcateDto {
  CategoryProductItemVO convert2VO() {
    return CategoryProductItemVO(pic: handleUrl(pic), title: title);
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
