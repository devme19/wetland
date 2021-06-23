import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:wetland/core/config/config.dart';
import 'package:wetland/data/model/view_model.dart';
import 'package:wetland/presentation/controller/content_page_controller.dart';
import 'package:wetland/presentation/helper/state_status.dart';
import 'package:wetland/presentation/widgets/loading_widget.dart';
import 'package:wetland/presentation/widgets/tab_bar_view_widget.dart';
import 'package:wetland/presentation/widgets/tabbar_view_widget.dart';
import 'package:wetland/presentation/widgets/type_widget.dart';
import 'package:wetland/presentation/widgets/wetland_box_widget.dart';
class ContentPagePhone extends GetView<ContentPageController> {
  double screenWidth;
  List<Widget> tabs =[];
  List<Widget> tabBarView =[];
  AppBar appBar = AppBar();
  String id;
  bool isEn = false;
  String searchTxt='';
  TextEditingController searchTxtController = TextEditingController();
  int selectedTabIndex = 0;
  Widget typeWidget = Container();
  contentOfTypeWidget(Widget type){
    typeWidget = type;
  }
  ContentPagePhone(){
    id = Get.arguments[0];
    isEn = Get.arguments[1];
    controller.getView(id);
  }
  @override
  Widget build(BuildContext context) {
    screenWidth = Get.width;
    return
      SafeArea(
        child:
        Obx(()=>Scaffold(
          backgroundColor: bgColor,
          body:
          Stack(
            children: [
              CustomScrollView(
                controller: controller.scrollController.value,
                slivers: [
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
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                              child: WetlandsBoxWidget()
                          ),
                        ),
                      )
                    ],)
                  ),
                  controller.getViewState.value == StateStatus.LOADING?
                  SliverToBoxAdapter(child: LoadingWidget()):
                  SliverToBoxAdapter(child:
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.network(controller.viewEntity.value.data.info.image,fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(isEn?controller.viewEntity.value.data.info.titleEn:controller.viewEntity.value.data.info.title,style: TextStyle(fontWeight: FontWeight.bold,color: pColor,fontSize: 18),),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(isEn?controller.viewEntity.value.data.info.descriptionEn:controller.viewEntity.value.data.info.description,
                                      style: TextStyle(fontSize: 16,height: 2),


                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),),
                  controller.getViewState.value == StateStatus.LOADING?
                  SliverToBoxAdapter(child: Container()):
                  SliverToBoxAdapter(
                      child:
                      Container(
                        // height: 2.7*Get.height/3,
                        margin: EdgeInsets.all(12),

                        child: Column(
                          children: [
                            Container(
                              // color: Colors.purple,
                              decoration: BoxDecoration(
                                color: Color(0xffE8E0CD).withOpacity(0.3),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                              ),
                              padding: EdgeInsets.only(right:8.0,left: 8.0),
                              height: 70,
                              child: Row(
                                children: [
                                  IconButton(icon: Icon(Icons.filter_alt_outlined,color: Color(0xffA1977D)), onPressed: (){
                                    showMaterialModalBottomSheet(
                                        context: context,
                                        builder: (context) {

                                          return Container(
                                              height: 200, child: Center(child: controller.createTypeList(selectedTabIndex)));
                                        }
                                    );
                                  }),
                                  IconButton(icon:Icon( controller.isGrid.value?Icons.list:Icons.grid_view,color: Color(0xffA1977D),), onPressed: (){
                                    controller.isGrid.value = !controller.isGrid.value;
                                  }),
                                  Expanded(
                                    child: TextFormField(
                                      controller: searchTxtController,
                                      textInputAction: TextInputAction.done,
                                      onEditingComplete: () {
                                        FocusScopeNode currentFocus = FocusScope.of(context);
                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }
                                        controller.searchTxt.value = '&text='+searchTxtController.text;
                                      },
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          labelText: isEn?'Search':'جستجو',
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                                              borderSide:
                                              BorderSide.none

                                          ),
                                          border:OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                                              borderSide:
                                              BorderSide.none
                                          )
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('Content Language'.tr),
                                      languageWidget(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // decoration: BoxDecoration(
                              //     border: Border.all(color:Color(0xffE8E0CD).withOpacity(0.3) )
                              // ),
                                child: Row(children: buildHeader(),)),
                          ],
                        ),
                      )
                  ),
                  controller.getViewState.value == StateStatus.LOADING?
                      SliverToBoxAdapter(child: Container(),):
                  TabBarViewWidget(isEn: isEn,parameters: controller.parameters.value+controller.searchTxt.value+controller.langParam.value+controller.selectedTypeId.value,index: controller.selectedTabIndex.value,isAdvance: false,isGrid: controller.isGrid.value,)
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: appBar.preferredSize.height,
                      color: Colors.transparent,
                      child: Row(
                        children: [

                          Container(
                            margin: EdgeInsets.only(left:9,right: 9),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: toggleColor.withOpacity(0.8)),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back,color: Colors.black,),
                              onPressed: ()=> Get.back(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),),
      );
  }
   List<Widget> buildHeader(){
    tabs.clear();
    tabs.add(tabItemWidget(0, isEn ? 'All' : 'همه'));
    int index =0;
    for(Type type in controller.viewEntity.value.data.type) {
      index++;
      tabs.add(tabItemWidget(index, isEn ? type.titleEn : type.title));
      // tabBarViewWidgets[i] = TabBarViewWidget(isEn: isEn,parameters: '?category_id='+controller.categoryDetailEntity.value.data.info.alias+'&type_id='+type.id.toString()+search,);
      // i++;
    }
    return tabs;
  }
  Widget tabItemWidget(int index,title){
    return Expanded(
      child: InkWell(
        onTap: (){
          controller.selectTab(index,contentOfTypeWidget);
          selectedTabIndex = index;
        },
        child: Container(
          decoration: BoxDecoration(
            color: controller.selectedTabIndex.value == index? Color(0xffE8E0CD).withOpacity(0.3):Colors.transparent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),

          child:  Tab(
              child: Text(title,
                  style: TextStyle(fontWeight:  controller.selectedTabIndex.value == index?FontWeight.bold:FontWeight.normal))),
        ),
      ),
    );
  }

  // List<Widget> buildType(){
  //   List<Widget> list=[];
  //   for(int i=0;i<controller.categoryDetailEntity.value.data.type.length;i++)
  //     list.add(Row(children: [
  //       Text(isEn?controller.categoryDetailEntity.value.data.type[i].titleEn:controller.categoryDetailEntity.value.data.type[i].title),
  //       Checkbox( value: this.showvalue,
  //         onChanged: (bool value) {
  //           setState(() {
  //             this.showvalue = value;
  //           });
  //         },  )
  //     ],));
  // }
  Widget languageWidget(){
    return Container(
      width: 80,
      height: 40,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: controller.contentLangIsEn.value?Colors.redAccent.withOpacity(0.5):Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),

                height: 40,
                width: 40,
                child:
                Center(child: Text('En',style: TextStyle(color: controller.contentLangIsEn.value?Colors.white:Colors.black,fontWeight:controller.contentLangIsEn.value? FontWeight.bold:FontWeight.normal),)),
              ),
              onTap:()=> controller.changeLanguage(true),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: !controller.contentLangIsEn.value?Colors.redAccent.withOpacity(0.5):Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Center(child: Text('فا',style: TextStyle(color: controller.contentLangIsEn.value?Colors.black:Colors.white,fontWeight:controller.contentLangIsEn.value? FontWeight.normal:FontWeight.bold))),
              ),
              onTap: ()=> controller.changeLanguage(false),
            ),
          ),
        ],
      ),
    );
  }

  void _onHorizontalSwipe(SwipeDirection direction) {
    if (isEn) {
      if (direction == SwipeDirection.left) {
        if (selectedTabIndex < tabs.length - 1) {
          controller.selectTab(selectedTabIndex + 1, contentOfTypeWidget);
          selectedTabIndex++;
        }
      } else {
        if (selectedTabIndex > 0) {
          controller.selectTab(selectedTabIndex - 1, contentOfTypeWidget);
          selectedTabIndex--;
        }
      }
    }
    else {
      if (direction == SwipeDirection.right) {
        if (selectedTabIndex < tabs.length - 1) {
          controller.selectTab(selectedTabIndex + 1, contentOfTypeWidget);
          selectedTabIndex++;
        }
      } else {
        if (selectedTabIndex > 0) {
          controller.selectTab(selectedTabIndex - 1, contentOfTypeWidget);
          selectedTabIndex--;
        }
      }
    }
  }
}