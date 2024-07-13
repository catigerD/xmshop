import 'package:get/get.dart';
import 'package:xmshop/app/api/dio_manager.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/api/url_manager.dart';
import 'package:xmshop/app/model/focus_dto.dart';
import 'package:xmshop/app/model/plist_dto.dart';
import 'package:xmshop/app/model/response_dto.dart';

class HomeHotSealController extends GetxController {
  final header = const HomeHotSealHeaderVO(title: "", subTitle: "").obs;
  final bannerList = <HomeHotSealBannerVO>[].obs;

  final commodityList = <HomeHotSealCommodityVO>[].obs;

  @override
  void onInit() {
    _initHeader();
    _initBanner();
    _initCommodity();
    super.onInit();
  }

  void _initHeader() {
    header.value =
        const HomeHotSealHeaderVO(title: "热销甄选", subTitle: "更多手机推荐 >");
  }

  void _initBanner() async {
    final response =
        await dio.get(PathManager.apiFocus, queryParameters: {"position": 2});
    final dtoList = ResponseDto<List<FocusDto>>.fromJson(
        response.data, (json) {
      return (json as List)
          .map((e) => FocusDto.fromJson(e))
          .toList();
    }).result;
    bannerList.value = dtoList?.map((e) => e.convert2VO()).toList() ?? [];
  }

  void _initCommodity() async {
    final response =
        await dio.get(PathManager.apiPlist, queryParameters: {"is_hot": 1});
    final dtoList = ResponseDto.fromJson(response.data, (json) {
      return (json as List)
          .map((e) => PListDto.fromJson(e))
          .toList();
    }).result;
    commodityList.value =
        dtoList?.map((e) => e.convert2VO()).take(3).toList() ?? [];
  }
}

extension on FocusDto {
  HomeHotSealBannerVO convert2VO() {
    return HomeHotSealBannerVO(pic: handleUrl(pic));
  }
}

class HomeHotSealHeaderVO {
  final String title;
  final String subTitle;

  const HomeHotSealHeaderVO({
    required this.title,
    required this.subTitle,
  });
}

class HomeHotSealBannerVO {
  final String pic;

  const HomeHotSealBannerVO({
    required this.pic,
  });
}

extension on PListDto {
  HomeHotSealCommodityVO convert2VO() {
    return HomeHotSealCommodityVO(
        title: title,
        subTitle: subTitle,
        price: "￥$price",
        pic: handleUrl(pic));
  }
}

class HomeHotSealCommodityVO {
  final String title;
  final String subTitle;
  final String price;
  final String pic;

  const HomeHotSealCommodityVO({
    required this.title,
    required this.subTitle,
    required this.price,
    required this.pic,
  });
}
