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
class TabBarViewWidget1 extends StatelessWidget{
  bool isEn;
  bool isGrid = false;
  List<Widget> contents=[];
  List<Content> contentList =[];
  TabBarViewWidget1({this.isEn,this.isGrid}){
    buildContent(contentList);
  }

  @override
  Widget build(BuildContext context) {
    return
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isGrid?2:1,
        ),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return contents[index];
          },
          childCount: contents.length,
        ),
      );
  }
  buildContent(List<Content> contentList){
    contents.clear();
    for(Content content in contentList) {
      contents.add(Item(
        isEn: isEn,
        content: content,
      ));
    }
  }
}
