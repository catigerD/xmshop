import 'package:get/get.dart';
import 'package:xmshop/app/api/dio_manager.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/api/url_manager.dart';
import 'package:xmshop/app/model/home_focus_dto.dart';
import 'package:xmshop/app/model/home_plist_dto.dart';
import 'package:xmshop/app/model/response_dto.dart';

class HomeHotSealController extends GetxController {
  final header = const HomeBestSealHeaderVO(title: "", subTitle: "").obs;
  final bannerList = <HomeBestSealBannerVO>[].obs;

  final commodityList = <HomeBestSealCommodityVO>[].obs;

  @override
  void onInit() {
    _initHeader();
    _initBanner();
    _initCommodity();
    super.onInit();
  }

  void _initHeader() {
    header.value =
        const HomeBestSealHeaderVO(title: "热销甄选", subTitle: "更多手机推荐 >");
  }

  void _initBanner() async {
    final response =
        await dio.get(PathManager.apiFocus, queryParameters: {"position": 2});
    final dtoList = ResponseDto<List<HomeFocusDto>>.fromJson(
        response.data, (json) {
      return (json as List)
          .map((e) => HomeFocusDto.fromJson(e))
          .toList();
    }).result;
    bannerList.value = dtoList?.map((e) => e.convert2VO()).toList() ?? [];
  }

  void _initCommodity() async {
    final response =
        await dio.get(PathManager.apiPlist, queryParameters: {"is_hot": 1});
    final dtoList = ResponseDto.fromJson(response.data, (json) {
      return (json as List)
          .map((e) => HomePListDto.fromJson(e))
          .toList();
    }).result;
    commodityList.value =
        dtoList?.map((e) => e.convert2VO()).take(3).toList() ?? [];
  }
}

extension on HomeFocusDto {
  HomeBestSealBannerVO convert2VO() {
    return HomeBestSealBannerVO(pic: handleUrl(pic));
  }
}

class HomeBestSealHeaderVO {
  final String title;
  final String subTitle;

  const HomeBestSealHeaderVO({
    required this.title,
    required this.subTitle,
  });
}

class HomeBestSealBannerVO {
  final String pic;

  const HomeBestSealBannerVO({
    required this.pic,
  });
}

extension on HomePListDto {
  HomeBestSealCommodityVO convert2VO() {
    return HomeBestSealCommodityVO(
        title: title,
        subTitle: subTitle,
        price: "￥$price",
        pic: handleUrl(pic));
  }
}

class HomeBestSealCommodityVO {
  final String title;
  final String subTitle;
  final String price;
  final String pic;

  const HomeBestSealCommodityVO({
    required this.title,
    required this.subTitle,
    required this.price,
    required this.pic,
  });
}
