import 'package:get/get.dart';
import 'package:xmshop/app/api/dio_manager.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/home_pcate_dto.dart';
import 'package:xmshop/app/model/response_dto.dart';

class CategoryTabController extends GetxController {
  final tabList = <CategoryTabItemVO>[].obs;
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    _initTabs();
    super.onInit();
  }

  void _initTabs() async {
    final response = await dio.get(PathManager.apiPCate);
    List<HomePcateDto>? dtoList;
    try {
      dtoList = ResponseDto<List<HomePcateDto>>.fromJson(response.data, (json) {
        return (json as List).map((e) => HomePcateDto.fromJson(e)).toList();
      }).result;
    } catch (e) {
      dtoList = null;
    }
    tabList.value = dtoList?.map((e) => e.convert2VO()).toList() ?? [];
  }

  void selected(int index) {
    selectedIndex.value = index;
  }
}

extension on HomePcateDto {
  CategoryTabItemVO convert2VO() {
    return CategoryTabItemVO(title: title);
  }
}

class CategoryTabItemVO {
  final String title;

//<editor-fold desc="Data Methods">
  const CategoryTabItemVO({
    required this.title,
  });
//</editor-fold>
}
