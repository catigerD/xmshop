import 'package:get/get.dart';
import 'package:xmshop/app/modules/detail/detail_binding.dart';
import 'package:xmshop/app/modules/detail/detail_view.dart';
import 'package:xmshop/app/modules/product/product_binding.dart';
import 'package:xmshop/app/modules/product/product_view.dart';
import 'package:xmshop/app/modules/search/search_bindings.dart';
import 'package:xmshop/app/modules/search/search_view.dart';

import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DETAIL;

  static final routes = [
    GetPage(
        name: _Paths.TABS,
        page: () => const TabsView(),
        binding: TabsBinding()),
    GetPage(
        name: _Paths.PRODUCT,
        page: () => const ProductView(),
        binding: ProductBinding()),
    GetPage(
        name: _Paths.SEARCH,
        page: () => const SearchView(),
        binding: SearchBindings()),
    GetPage(
        name: _Paths.DETAIL,
        page: () => DetailView(),
        binding: DetailBinding()),
  ];
}
