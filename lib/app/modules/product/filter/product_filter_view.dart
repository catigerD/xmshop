import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/filter/product_filter_controller.dart';

class ProductFilterView extends GetView<ProductFilterController> {
  static final selectedColor = Color(int.parse("0xffe8671f"));
  static final unselectedColor = Color(int.parse("0xff7e7e7e"));

  const ProductFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 50,
      child: Obx(() {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                controller.itemList.map((e) => _item(context, e)).toList());
      }),
    );
  }

  Widget _item(BuildContext context, ProductFilterItemVO vo) {
    return InkWell(
      onTap: () {
        controller.selectItem(vo);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            vo.text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: vo.selected ? selectedColor : unselectedColor),
          ),
          vo.sortState.icon == null
              ? const SizedBox(
                  width: 0,
                  height: 0,
                )
              : Icon(
                  vo.sortState.icon,
                  size: 20,
                )
        ],
      ),
    );
  }
}

extension on ProductFilterSortState {
  IconData? get icon {
    if (this == ProductFilterSortState.none) {
      return null;
    }

    if (this == ProductFilterSortState.down) {
      return Icons.arrow_drop_down;
    }

    return Icons.arrow_drop_up;
  }
}
