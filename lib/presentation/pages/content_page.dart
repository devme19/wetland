import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetland/presentation/pages/phone/content_page.dart';
import 'package:wetland/presentation/pages/phone/main_page.dart';
import 'package:wetland/presentation/widgets/item.dart';

import '../../core/config/config.dart';

class ContentPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveView()

    );
  }
}
class ResponsiveView extends GetResponsiveView {
  @override
  Widget builder() {
    return ResponsiveViewCases();
  }
}
class ResponsiveViewCases extends GetResponsiveView {
  ResponsiveViewCases() : super(alwaysUseBuilder: false);

  @override
  Widget phone() => ContentPagePhone();

  // @override
  // Widget desktop() => ContentPageDesktop();
}

