import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:wetland/core/config/config.dart';
import 'package:wetland/data/model/view_model.dart';
import 'package:wetland/presentation/controller/content_page_controller.dart';
import 'package:wetland/presentation/controller/main_page_controller.dart';
import 'package:wetland/presentation/helper/state_status.dart';
import 'package:wetland/presentation/widgets/drop_down_widget.dart';
import 'package:wetland/presentation/widgets/error_widget.dart';
import 'package:wetland/presentation/widgets/loading_widget.dart';
import 'package:wetland/presentation/widgets/multi_select_widget.dart';
import 'package:wetland/presentation/widgets/tab_bar_view_widget.dart';
import 'package:wetland/presentation/widgets/wetland_box_widget.dart';
class AdvanceSearchPage extends GetView<ContentPageController> {

  int selectedTabIndex = 0;
  bool isEn = false;
  List<Widget> tabs =[];
  List<Widget> tabBarView =[];
  TextEditingController searchTxtController = TextEditingController();
  TextEditingController authorTxtController = TextEditingController();
  Widget typeWidget = Container();
  AppBar appBar = AppBar();
  final _formKey = GlobalKey<FormState>();
  MainPageController mainController = Get.put(MainPageController());
  AdvanceSearchPage(){
    if(controller.viewEntity.value.data == null)
      controller.getView('');
  }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child:
        Scaffold(
          body:
          Stack(children: [
            Obx(()=>
                CustomScrollView(
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
                    SliverToBoxAdapter(child: Container(
                        height:400,child: Center(
                          child: Container(
                      width: 120,
                          height: 120,
                          child: LoadingWidget()),
                        ))):
                    SliverToBoxAdapter(
                        child:
                        Container(
                          // height: 2.7*Get.height/3,
                          margin: EdgeInsets.all(12),
                          // decoration: BoxDecoration(
                          //     border: Border.all(color:Color(0xffE8E0CD).withOpacity(0.3) )
                          // ),
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
                                    IconButton(icon: Icon(Icons.search), onPressed: (){
                                      Get.bottomSheet(advanceSearchForm());
                                    }),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('Content Language'.tr),
                                          languageWidget(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(children: buildHeader(),),
                            ],
                          ),
                        )
                    ),
                    controller.getViewState.value == StateStatus.LOADING?
                    SliverToBoxAdapter(child: Container(),):
                    TabBarViewWidget(isEn: mainController.isUs.value,parameters: controller.parameters.value+controller.advanceSearchTxt.value+controller.authorSearchTxt.value+controller.langParam.value+controller.selectedTypeId.value+controller.selectedYearParam.value+controller.treeParam.value,index: controller.selectedTabIndex.value,isAdvance: true,isGrid: controller.isGrid.value,)


                  ],
                )),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: appBar.preferredSize.height,
                    color: Colors.transparent,
                    child: Row(
                      children: [

                        Container(
                          margin: EdgeInsets.only(left: 9,right: 9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: toggleColor.withOpacity(0.8)),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back,color: Colors.black,),
                            onPressed: ()=> Navigator.pop(Get.context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],)
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
  List<Widget> buildHeader(){
    tabs.clear();
    tabs.add(tabItemWidget(0, 'All'.tr));
    int index =0;
    for(Type type in controller.viewEntity.value.data.type) {
      index++;
      tabs.add(tabItemWidget(index, mainController.isUs.value ? type.titleEn : type.title));
      // tabBarViewWidgets[i] = TabBarViewWidget(isEn: isEn,parameters: '?category_id='+controller.categoryDetailEntity.value.data.info.alias+'&type_id='+type.id.toString()+search,);
      // i++;
    }
    return tabs;
  }
  contentOfTypeWidget(Widget type){
    typeWidget = type;
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
  Widget advanceSearchForm(){
    String search,author,date;
    final focus = FocusNode();
    searchTxtController.text = controller.search;
    authorTxtController.text = controller.authorTxt;
    return
      Form(
        key: _formKey,
        child: Container(

          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          height: 500,
        child:
        SingleChildScrollView(
          child: Column(children: [
            TextFormField(
              controller: searchTxtController,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                FocusScopeNode currentFocus = FocusScope.of(Get.context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                Navigator.pop(Get.context);
                controller.advanceSearchTxt.value = '&text='+searchTxtController.text;
                controller.search = searchTxtController.text;
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  labelText: 'Search'.tr,
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
            Divider(),
            TextFormField(
              controller: authorTxtController,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                FocusScopeNode currentFocus = FocusScope.of(Get.context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                Navigator.pop(Get.context);
                controller.authorSearchTxt.value = '&author='+authorTxtController.text;
                controller.authorTxt = authorTxtController.text;
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  labelText: 'Author'.tr,
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
            Divider(),
            Container(
              height: 60,
                child: Row(
                  children: [
                    Expanded(child: DropDown(parentAction: selectedYear,selectedYear: controller.selectedYear.value,)),
                  ],
                )
            ),
            Divider(),
            multiSelect(),
            // MultiSelectWidget(tree: controller.viewEntity.value.data.tree,),
            Divider(),
            SizedBox(height: 21,),
            // Row(
            //   children: [
            //     Expanded(
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             primary: Colors.green
            //           ),
            //           onPressed: (){}, child: Padding(
            //             padding: const EdgeInsets.all(16.0),
            //             child: Text('Confirm'.tr),
            //           )),
            //     ),
            //     Expanded(child: Container()),
            //     Expanded(
            //       child:
            //       ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //               primary: Colors.red
            //           ),
            //           onPressed: (){}, child: Padding(
            //         padding: const EdgeInsets.all(16.0),
            //         child: Text('Cancel'.tr),
            //       )),
            //     ),
            //   ],
            // )
          ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade400
                      ),
                      onPressed: (){
                        authorTxtController.clear();
                        searchTxtController.clear();
                        controller.clearAdvanceSearchFilters();
                        Navigator.pop(Get.context);
                      }, child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Clear Filters'.tr),
                      )),
          ],),
        ),
    ),
      );
  }
  selectedYear(String year){
    Navigator.pop(Get.context);
    controller.selectedYear.value = year;
    if(year.length!=4)
      controller.selectedYearParam.value = '';
    else
    controller.selectedYearParam.value = '&year=$year';

  }
  Widget multiSelect(){
    List<Tree> tree = controller.viewEntity.value.data.tree;
    final _items = tree
        .map((tree) => MultiSelectItem<Tree>(tree, tree.title))
        .toList();
    return
      MultiSelectDialogField(

      items: _items,
      chipDisplay: MultiSelectChipDisplay(),
      // listType: MultiSelectListType.CHIP,
      cancelText: Text('Cancel'.tr),
      confirmText: Text('Confirm'.tr),
      title: Text('Knowledge tree'.tr),
      initialValue: controller.selectedTree,
      searchable: true,
      searchHint: 'Search'.tr,
      // selectedColor: Colors.grey,
      selectedItemsTextStyle: TextStyle(fontWeight: FontWeight.bold),
      selectedColor: Colors.green.withOpacity(0.7),

      decoration: BoxDecoration(
        // color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      // buttonIcon: Icon(
      //   Icons.account_tree,
      //   color: Colors.blue,
      // ),
      buttonText: Text(
        'Select knowledge tree'.tr,
        // style: TextStyle(
        //   color: Colors.blue[800],
        //   fontSize: 16,
        // ),
      ),
      onConfirm: (results) {
        // Get.back();
        Navigator.pop(Get.context);
        controller.selectedTree.clear();
        final list = results.map((e)=> e as Tree).toList();
        controller.selectedTree.addAll(list);
        String treeParams ='';
        if(controller.selectedTree.length>0)
          treeParams='&tree_id=';
        for(int i=0;i<controller.selectedTree.length;i++) {
          treeParams += '${controller.selectedTree[i].id.toString()}';
          if(i+1 !=controller.selectedTree.length)
            treeParams+=',';
        }
        if(treeParams!='')
          controller.treeParam.value = treeParams;

      },
    );
  }
}
