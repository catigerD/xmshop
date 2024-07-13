import 'package:get/get.dart';
import 'package:xmshop/app/api/http_client.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/best_cate_dto.dart';

class HomeCategoryController extends GetxController {
  final itemList = <HomeCategoryItemVO>[].obs;

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  void _loadData() async {
    final categoryDtoList = await HttpClient.getList<BestCateDto>(
        PathManager.apiBestCate,
        fromJsonT: BestCateDto.fromJson);
    final voList = categoryDtoList
            ?.map((e) =>
                HomeCategoryItemVO(iconUrl: HttpClient.handleUrl(e.pic), title: e.title))
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
