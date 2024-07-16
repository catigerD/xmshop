import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/api/http_client.dart';
import 'package:xmshop/app/api/path_manager.dart';
import 'package:xmshop/app/model/plist_dto.dart';
import 'package:xmshop/app/widget/async/async_vo.dart';

class ProductListController extends GetxController {
  final loadMoreThreshold = 300;

  final scrollController = ScrollController();

  final Rx<AsyncVO> asyncVO = Rx<AsyncVO>(AsyncLoadingVO());
  var _pageIndex = 1;
  final _pageSize = 8;

  var _isLoading = false;
  final hasMore = true.obs;

  @override
  void onInit() {
    _listenScroll();
    _loadList();
    super.onInit();
  }

  void _listenScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - loadMoreThreshold) {
        _loadList();
      }
    });
  }

  void _loadList() async {
    if (!hasMore.value) {
      return;
    }

    if (_isLoading) {
      return;
    }
    _isLoading = true;

    final cid = Get.arguments?["pid"] as String?;
    if (cid == null) {
      asyncVO.value = AsyncEmptyVO();
      _isLoading = false;
      hasMore.value = false;
      return;
    }

    final dtoList = await HttpClient.getList(PathManager.apiPlist,
        queryParameters: {
          "cid": cid,
          "page": _pageIndex,
          "pageSize": _pageSize
        },
        fromJsonT: PListDto.fromJson);
    final voList = dtoList?.map((e) => e._convertTo()).toList() ?? [];
    final List<ProductItemVO> itemList = [];

    final currentAsyncVO = asyncVO.value;
    if (currentAsyncVO is ProductListVO) {
      itemList.addAll(currentAsyncVO.content);
    }
    itemList.addAll(voList);

    asyncVO.value =
        itemList.isEmpty ? AsyncEmptyVO() : ProductListVO(content: itemList);

    _pageIndex++;
    hasMore.value = voList.length >= _pageSize;
    _isLoading = false;
  }
}

typedef ProductListVO = AsyncContentVO<List<ProductItemVO>>;

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
