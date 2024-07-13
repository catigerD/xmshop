import 'package:get/get.dart';
import 'package:xmshop/app/model/focus_dto.dart';

import '../../../api/http_client.dart';
import '../../../api/path_manager.dart';

class HomeBannerController extends GetxController {
  var imgUrlList = <String>[].obs;

  @override
  void onInit() {
    _fetchData();
    super.onInit();
  }

  void _fetchData() async {
    final focusList = await HttpClient.getList<FocusDto>(PathManager.apiFocus,
        fromJsonT: FocusDto.fromJson);
    imgUrlList.value = focusList
            ?.where((e) => e.pic.isNotEmpty)
            .map((e) => HttpClient.handleUrl(e.pic))
            .toList() ??
        [];
  }
}
