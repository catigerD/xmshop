import 'package:get/get.dart';
import 'package:xmshop/app/api/dio_manager.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/api/url_manager.dart';
import 'package:xmshop/app/model/best_cate_dto.dart';
import 'package:xmshop/app/model/response_dto.dart';

class HomeCategoryController extends GetxController {
  final itemList = <HomeCategoryItemVO>[].obs;

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  void _loadData() async {
    final response = await dio.get(PathManager.apiBestCate);
    final categoryDtoList =
        ResponseDto<List<BestCateDto>>.fromJson(response.data, (json) {
      return (json as List).map((e) => BestCateDto.fromJson(e)).toList();
    }).result;
    final voList = categoryDtoList
            ?.map((e) =>
                HomeCategoryItemVO(iconUrl: handleUrl(e.pic), title: e.title))
            .toList() ??
        [];
    itemList.value = voList;
  }
}

class HomeCategoryItemVO {
  final String iconUrl;
  final String title;

  HomeCategoryItemVO({required this.iconUrl, required this.title});
}
