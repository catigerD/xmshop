import 'package:get/get.dart';
import 'package:xmshop/app/api/http_client.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/plist_dto.dart';
import 'package:xmshop/app/widget/async/async_vo.dart';

class ProductListController extends GetxController {
  final Rx<AsyncVO> asyncVO = Rx<AsyncVO>(AsyncLoadingVO());

  @override
  void onInit() {
    _initList();
    super.onInit();
  }

  void _initList() async {
    final cid = Get.arguments?["pid"] as String?;
    if (cid == null) {
      asyncVO.value = AsyncEmptyVO();
      return;
    }

    final dtoList = await HttpClient.getList(PathManager.apiPlist,
        queryParameters: {"cid": cid}, fromJsonT: PListDto.fromJson);
    final itemList = dtoList?.map((e) => e._convertTo()).toList() ?? [];
    asyncVO.value = itemList.isEmpty
        ? AsyncEmptyVO()
        : AsyncContentVO<List<ProductItemVO>>(content: itemList);
  }
}

extension on PListDto {
  ProductItemVO _convertTo() {
    return ProductItemVO(
        pic: HttpClient.handleUrl(pic),
        title: title,
        subTitle: subTitle,
        price: "￥$price");
  }
}

class ProductItemVO {
  final String pic;
  final String title;
  final String subTitle;
  final String price;

  const ProductItemVO({
    required this.pic,
    required this.title,
    required this.subTitle,
    required this.price,
  });
}
