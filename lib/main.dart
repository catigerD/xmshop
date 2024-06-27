import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/tabs/views/tabs_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    title: "Application",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
