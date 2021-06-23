import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetland/main.dart';
import 'package:wetland/presentation/bindings/advance_search_page_binding.dart';
import 'package:wetland/presentation/bindings/content_detail_page_binding.dart';
import 'package:wetland/presentation/bindings/content_page_binding.dart';
import 'package:wetland/presentation/bindings/main_binding.dart';
import 'package:wetland/presentation/pages/content_page.dart';
import 'package:wetland/presentation/pages/phone/advance_search_page.dart';
import 'package:wetland/presentation/pages/phone/detail_page.dart';

class WetLandsRoutes{
  static final String contentPage = '/contentPage';
  static final String detailPage = '/detailPage';
  static final String advanceSearchPage = '/advanceSearchPage';
  // static final String mainPage = '/mainPage';
}
class WetLands{
  static final pages = [
    GetPage(name: WetLandsRoutes.contentPage, page: () => ContentPage(),bindings: [MainBinding(),ContentPageBinding()]),
    GetPage(name: WetLandsRoutes.detailPage, page: () => DetailPage(),bindings: [MainBinding(),ContentDetailPageBinding()]),
    GetPage(name: WetLandsRoutes.advanceSearchPage, page: () => AdvanceSearchPage(),bindings: [MainBinding(),AdvanceSearchPageBinding()]),
    // GetPage(name: WetLandsRoutes.mainPage, page: () => MyApp()),
  ];
}