import 'package:get/get.dart';
import 'package:xmshop/app/api/http_client.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/plist_dto.dart';

class HomeBestSealController extends GetxController {
  final headerVO = const HomeBestSealHeaderVO(title: "", subtitle: "").obs;
  final commodityVOList = <HomeBestSealCommodityVO>[].obs;

  @override
  void onInit() {
    _initHeader();
    _initCommodityList();
    super.onInit();
  }

  void _initHeader() {
    headerVO.value =
        const HomeBestSealHeaderVO(title: "省心优惠", subtitle: "全部优惠 >");
  }

  void _initCommodityList() async {
    List<PListDto>? dtoList = await HttpClient.getList<PListDto>(
        PathManager.apiPlist,
        queryParameters: {"is_best": 1},
        fromJsonT: PListDto.fromJson);
    commodityVOList.value = dtoList?.map((e) => e.convertTo()).toList() ?? [];
  }
}

class HomeBestSealHeaderVO {
  final String title;
  final String subtitle;

  const HomeBestSealHeaderVO({
    required this.title,
    required this.subtitle,
  });
}

extension on PListDto {
  HomeBestSealCommodityVO convertTo() {
    return HomeBestSealCommodityVO(
        pic: HttpClient.handleUrl(pic),
        title: title,
        subTitle: subTitle,
        price: "￥$price");
  }
}

class HomeBestSealCommodityVO {
  final String pic;
  final String title;
  final String subTitle;
  final String price;

  const HomeBestSealCommodityVO({
    required this.pic,
    required this.title,
    required this.subTitle,
    required this.price,
  });
}
