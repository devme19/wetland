import 'package:auto_animated/auto_animated.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wetland/core/config/config.dart';
import 'package:wetland/presentation/controller/main_page_controller.dart';
import 'package:wetland/presentation/helper/state_status.dart';
import 'package:wetland/presentation/navigations/wetlands.dart';
import 'package:wetland/presentation/widgets/error_widget.dart';
import 'package:wetland/presentation/widgets/language_widget.dart';
import 'package:wetland/presentation/widgets/loading_widget.dart';
import 'package:wetland/presentation/widgets/menu.dart';
import 'package:wetland/presentation/widgets/wetland_box_widget.dart';
import 'package:get/get.dart';
class Phone extends GetView<MainPageController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  Orientation orientation;


  Phone(){
   controller.getCategories();
  }

  Widget buildAnimatedItem(
      BuildContext context,
      int index,
      Animation<double> animation,
      ) =>
      // For example wrap with fade transition
  FadeTransition(
    opacity: Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animation),
    // And slide transition
    child: SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0, -0.1),
        end: Offset.zero,
      ).animate(animation),
      // Paste you Widget
      child: Menu(
        title: controller.categoryEntity.value.data.category[index].title,
        icon: controller.categoryEntity.value.data.category[index].icon,
          id: controller.categoryEntity.value.data.category[index].alias,
        isEn: controller.isUs.value,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    return
      SafeArea(
        child: Scaffold(
          key: _drawerKey,
          drawer: drawer(),
          body:
          Container(
            color: bgColor,
            child: CustomScrollView(
                slivers:
                [
                  SliverToBoxAdapter(child:
                  Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Image.asset("asset/images/banner2.png",fit: BoxFit.cover,height: 220,)),
                        ],
                      ),
                      Positioned(
                        top: 50,
                        left: (Get.width-250)/2,
                        child: Container(
                          width: 250,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child:
                            WetlandsBoxWidget(),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 5.0,
                          right: controller.isUs.value?Get.width-57:10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: toggleColor.withOpacity(0.8)
                            ),
                            child: IconButton(
                              icon: Icon(Icons.menu,color: Colors.black,),
                              onPressed: (){
                                _drawerKey.currentState.openDrawer();
                              },
                            ),
                          )),
                    ],)
                    // Image.asset("asset/images/banner2.png",fit: BoxFit.cover,)
                  ),
                 Obx(()=> controller.getCategoriesState.value == StateStatus.LOADING?
                 SliverToBoxAdapter(child:
                 LoadingWidget()):
                      controller.getCategoriesState.value == StateStatus.ERROR?
                          
                      SliverToBoxAdapter(child: ErrorWidgett()):
                     SliverPadding(
                       padding: EdgeInsets.all(32),
                       sliver:
                       LiveSliverGrid(

                         // If list and grid simultaneously in sight
                         // sync with LiveSliverList (see up)
                         delay: Duration(milliseconds: 250),

                         itemCount: controller.categoryEntity.value.data.category.length,
                         itemBuilder: buildAnimatedItem,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: orientation == Orientation.landscape?4:2,
                             crossAxisSpacing: 16,
                             mainAxisSpacing: 16,
                             mainAxisExtent:170,
                             childAspectRatio: 1.0
                         ),
                       ),
                       // SliverFadeTransition(
                       //   sliver: SliverGrid(
                       //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       //       // maxCrossAxisExtent: 500,
                       //         crossAxisCount: orientation == Orientation.landscape?4:2,
                       //         mainAxisSpacing: 15.0,
                       //         crossAxisSpacing: 15.0,
                       //         childAspectRatio: 1.0,
                       //         mainAxisExtent: 170
                       //     ),
                       //     delegate: SliverChildBuilderDelegate(
                       //           (BuildContext context, int index) {
                       //         return
                       //           Menu().item(index);
                       //       },
                       //       childCount: 8,
                       //     ),
                       //   ),
                       // ),
                     )
                   ,)
                ]
            ),
          ),
        ),
      );
  }
  Drawer drawer(){
    return Drawer(
      child: ListView(
        children: [
          // ListTile(
          //   title: Text('Home'.tr),
          //   onTap: (){},
          // ),
          // Divider(),
          ListTile(
            title: Text('Advance Search'.tr),
            onTap: (){
              Get.back();
              Get.toNamed(WetLandsRoutes.advanceSearchPage,arguments: controller.isUs.value);

            },
          ),
          Divider(),
          ListTile(
            title: Text('About'.tr),
            onTap: (){},
          ),
          Divider(),
          Column(
            children: [
              LanguageWidget(),
            ],
          ),
        ],
      ),
    );
  }
}