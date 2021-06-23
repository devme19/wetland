import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wetland/data/client.dart';
import 'package:wetland/presentation/bindings/main_binding.dart';
import 'package:wetland/presentation/controller/language_controller.dart';
import 'package:wetland/presentation/helper/notification.dart';
import 'package:wetland/presentation/navigations/wetlands.dart';
import 'package:wetland/utils/messages.dart';

import 'core/config/config.dart';
import 'presentation/pages/phone/main_page.dart';

void main() {
  runApp(MyApp());
  Client.init();
  LocalNotification.initialize();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool isEn =false;
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    if(box.hasData('isEn'))
      isEn = box.read('isEn');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Messages(),
      locale: isEn?Locale('en','US'):Locale('fa','IR'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'IranYekan',
      ),
      home: ResponsiveView(),
      getPages: WetLands.pages,
      initialBinding: MainBinding(),
    );
  }
}


class ResponsiveView extends GetResponsiveView{
  @override
  Widget builder() {
    return ResponsiveViewCases();
  }
}

class ResponsiveViewCases extends GetResponsiveView {
  ResponsiveViewCases() : super(alwaysUseBuilder: false);

  @override
  Widget phone() => Phone();

  // @override
  // Widget desktop() => Desktop(isTablet: screen.isTablet,);
}


