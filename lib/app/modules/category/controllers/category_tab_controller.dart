import 'package:get/get.dart';
import 'package:xmshop/app/api/http_client.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/pcate_dto.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';

class CategoryTabController extends GetxController {
  final tabList = <CategoryTabItemVO>[].obs;
  final selectedIndex = 0.obs;

  final parentController = Get.find<CategoryController>();

  @override
  void onInit() {
    _initTabs();
    super.onInit();
  }

  void _initTabs() async {
    List<PCateDto>? dtoList = await HttpClient.getList<PCateDto>(
        PathManager.apiPCate,
        fromJsonT: PCateDto.fromJson);
    tabList.value = dtoList?.map((e) => e.convert2VO()).toList() ?? [];
    parentController.select(tabList[selectedIndex.value].pid);
  }

  void select(int index) {
    selectedIndex.value = index;
  }
}

extension on PCateDto {
  CategoryTabItemVO convert2VO() {
    return CategoryTabItemVO(pid: id, title: title);
  }
}

class CategoryTabItemVO {
  final String pid;
  final String title;

//<editor-fold desc="Data Methods">
  const CategoryTabItemVO({
    required this.pid,
    required this.title,
  });
//</editor-fold>
}
