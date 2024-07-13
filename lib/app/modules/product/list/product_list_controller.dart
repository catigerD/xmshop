import 'package:get/get.dart';
import 'package:xmshop/app/api/http_client.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/plist_dto.dart';

class ProductListController extends GetxController {
  final productList = <ProductItemVO>[].obs;

  @override
  void onInit() {
    _initList();
    super.onInit();
  }

  void _initList() async {
    final cid = Get.arguments?["pid"] as String?;
    if (cid == null) {
      productList.value = [];
      return;
    }

    final dtoList = await HttpClient.getList(PathManager.apiPlist,
        queryParameters: {"cid": cid}, fromJsonT: PListDto.fromJson);
    productList.value = dtoList?.map((e) => e._convertTo()).toList() ?? [];
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
