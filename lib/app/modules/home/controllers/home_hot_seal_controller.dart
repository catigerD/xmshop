import 'package:get/get.dart';
import 'package:xmshop/app/api/http_client.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/focus_dto.dart';
import 'package:xmshop/app/model/plist_dto.dart';

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
    final dtoList = await HttpClient.getList<FocusDto>(PathManager.apiFocus,
        queryParameters: {"position": 2}, fromJsonT: FocusDto.fromJson);
    bannerList.value = dtoList?.map((e) => e.convert2VO()).toList() ?? [];
  }

  void _initCommodity() async {
    final dtoList = await HttpClient.getList<PListDto>(PathManager.apiPlist,
        queryParameters: {"is_hot": 1}, fromJsonT: PListDto.fromJson);
    commodityList.value =
        dtoList?.map((e) => e.convert2VO()).take(3).toList() ?? [];
  }
}

extension on FocusDto {
  HomeHotSealBannerVO convert2VO() {
    return HomeHotSealBannerVO(pic: HttpClient.handleUrl(pic));
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
        pic: HttpClient.handleUrl(pic));
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
