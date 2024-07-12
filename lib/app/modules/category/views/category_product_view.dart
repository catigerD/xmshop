import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/controllers/category_product_controller.dart';

class CategoryProductView extends GetView<CategoryProductController> {
  CategoryProductView({super.key, required this.pid}) {
    controller.loadPList(pid);
  }

  final String pid;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.itemList.isEmpty ? _loading() : _content();
    });
  }

  Widget _content() {
    return Obx(() {
      return MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          itemCount: controller.itemList.length,
          itemBuilder: (context, index) {
            return _item(context, controller.itemList[index]);
          });
    });
  }

  Widget _loading() {
    return const Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _item(BuildContext context, CategoryProductItemVO vo) {
    return Column(
      children: [
        AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  vo.pic,
                  fit: BoxFit.cover,
                ))),
        Text(
          vo.title,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}
