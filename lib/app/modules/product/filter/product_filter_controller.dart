import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/list/product_list_controller.dart';

class ProductFilterController extends GetxController {
  late final listController = Get.find<ProductListController>();

  final itemList = <ProductFilterItemVO>[
    const ProductFilterItemVO(
        type: ProductFilterType.all,
        text: "综合",
        selected: true,
        sortState: ProductFilterSortState.none),
    const ProductFilterItemVO(
        type: ProductFilterType.sale,
        text: "销量",
        selected: false,
        sortState: ProductFilterSortState.down),
    const ProductFilterItemVO(
        type: ProductFilterType.price,
        text: "价格",
        selected: false,
        sortState: ProductFilterSortState.up)
  ].obs;

  void selectItem(ProductFilterItemVO willSelectItem) {
    final selectedItem =
        itemList.firstWhereOrNull((e) => e.selected) ?? itemList.first;
    final resetList = itemList
        .map((e) => _updateItem(selectedItem, willSelectItem, e))
        .toList();
    itemList.value = resetList;

    final updateItem = itemList.firstWhere((e) => e.selected);
    listController.updateSort(updateItem.sort);
  }

  ProductFilterItemVO _updateItem(ProductFilterItemVO selectedItem,
      ProductFilterItemVO willSelectItem, ProductFilterItemVO handleItem) {
    if (willSelectItem.type != handleItem.type) {
      return handleItem.copyWith(selected: false);
    }

    if (willSelectItem.type == ProductFilterType.all) {
      return handleItem.copyWith(selected: true);
    }

    if (selectedItem.type != willSelectItem.type) {
      return handleItem.copyWith(selected: true);
    }

    final ProductFilterSortState targetState;
    switch (handleItem.sortState) {
      case ProductFilterSortState.up:
        targetState = ProductFilterSortState.down;
        break;
      case ProductFilterSortState.down:
        targetState = ProductFilterSortState.up;
        break;
      default:
        targetState = ProductFilterSortState.none;
        break;
    }

    return handleItem.copyWith(selected: true, sortState: targetState);
  }
}

class ProductFilterItemVO {
  final ProductFilterType type;
  final String text;
  final bool selected;
  final ProductFilterSortState sortState;

  const ProductFilterItemVO({
    required this.type,
    required this.text,
    required this.selected,
    required this.sortState,
  });

  ProductFilterItemVO copyWith({
    bool? selected,
    ProductFilterSortState? sortState,
  }) {
    return ProductFilterItemVO(
      type: type,
      text: text,
      selected: selected ?? this.selected,
      sortState: sortState ?? this.sortState,
    );
  }
}

extension on ProductFilterItemVO {
  String? get sort {
    if (type == ProductFilterType.all) {
      return null;
    }

    var sort = "";
    if (type == ProductFilterType.sale) {
      sort += "salecount_";
    } else if (type == ProductFilterType.price) {
      sort += "price_";
    } else {
      throw UnsupportedError("");
    }

    if (sortState == ProductFilterSortState.down) {
      sort += "-1";
    } else if (sortState == ProductFilterSortState.up) {
      sort += "1";
    } else {
      throw UnsupportedError("");
    }

    return sort;
  }
}

enum ProductFilterType { all, price, sale }

enum ProductFilterSortState { none, up, down }
