import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/controllers/category_toolbar_controller.dart';
import 'package:xmshop/app/routes/search_launcher.dart';
import 'package:xmshop/app/widget/search_app_bar.dart';

class CategoryToolbarView extends GetView<CategoryToolbarController>
    implements PreferredSizeWidget {
  const CategoryToolbarView({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(SearchAppBar.height);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DefaultSearchLauncher().to();
      },
      child: SearchAppBar(
        enable: false,
        hintText: controller.hintText.value,
      ),
    );
  }
}
