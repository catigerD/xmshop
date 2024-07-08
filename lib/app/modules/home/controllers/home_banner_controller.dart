import 'package:get/get.dart';
import 'package:xmshop/app/api/url_manager.dart';
import 'package:xmshop/app/model/home_focus_dto.dart';
import 'package:xmshop/app/model/response_dto.dart';

import '../../../api/dio_manager.dart';
import '../../../api/path_manager.dart';

class HomeBannerController extends GetxController {
  var imgUrlList = <String>[].obs;

  @override
  void onInit() {
    _fetchData();
    super.onInit();
  }

  void _fetchData() async {
    final response = await dio.get(PathManager.apiFocus);
    final focusList =
        ResponseDto<List<HomeFocusDto>>.fromJson(response.data, (json) {
      return (json as List).map((e) => HomeFocusDto.fromJson(e)).toList();
    }).result;

    imgUrlList.value = focusList
            ?.where((e) => e.pic.isNotEmpty)
            .map((e) => handleUrl(e.pic))
            .toList() ??
        [];
  }
}
