import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:wetland/data/model/advance_search_model.dart' as advance;
import 'package:wetland/data/model/content_model.dart';
import 'package:wetland/domain/entity/advance_search_entity.dart';
import 'package:wetland/domain/entity/content_entity.dart';
import 'package:wetland/presentation/controller/content_page_controller.dart';
import 'package:wetland/presentation/helper/state_status.dart';
import 'package:wetland/presentation/widgets/empty_widget.dart';
import 'package:wetland/presentation/widgets/error_widget.dart';
import 'package:wetland/presentation/widgets/item.dart';
import 'package:wetland/presentation/widgets/loading_widget.dart';
class TabBarViewWidget extends GetView<ContentPageController> {
  String parameters;
  bool isEn;
  bool isGrid = false;
  List<Widget> contents=[];
  int index;
  bool isAdvance = false;
   TabBarViewWidget({this.parameters, this.isEn,this.isGrid,this.index,this.isAdvance}){
    if(!isAdvance)
      controller.getContent(parameters,buildContent,index);
    else
      controller.getAdvanceSearchContent(parameters, buildAdvanceSearchContent, index);
  }

  @override
  Widget build(BuildContext context) {
    return
      Obx(()=>controller.getContentState.value == StateStatus.LOADING?
    SliverToBoxAdapter(child: Container(
      height: 400,
        child: Center(child: LoadingWidget()))):
    controller.getContentState.value == StateStatus.ERROR?

    SliverToBoxAdapter(child: ErrorWidgett()):controller.getContentState.value == StateStatus.SUCCESS?
    contents.length <= 0?

    SliverToBoxAdapter(child: Container(height:400,child: EmptyWidget())):SliverPadding(
      padding: EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isGrid?2:1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: isGrid?0.8:1.3
        ),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return contents[index];
          },
          childCount: contents.length,
        ),
      ),
    ):
    SliverToBoxAdapter(child: Container()));
  }
  buildContent(ContentEntity contentEntity){
    contents.clear();
    for(Content content in contentEntity.data.content) {
      contents.add(Item(
        isEn: isEn,
        content: content,
      ));
    }
  }
  buildAdvanceSearchContent(AdvanceSearchEntity advanceSearchEntity){
    for(Content content in advanceSearchEntity.data.content){
      contents.add(Item(isEn: isEn,content: content,));
    }
  }
}
