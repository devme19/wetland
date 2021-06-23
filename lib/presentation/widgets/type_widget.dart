import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wetland/data/model/view_model.dart';
import 'package:wetland/presentation/controller/content_page_controller.dart';
import 'package:wetland/presentation/helper/check_item.dart';
import 'package:wetland/presentation/widgets/check_item_widget.dart';
class TypeWidget extends GetView<ContentPageController> {
  List<Children> children;
  CheckItem checkItem;
  TypeWidget({this.children,this.checkItem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(16),
          child: children.length==0?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Lottie.asset('asset/lottie/emptyStatus.json',height: 100,width: 100),
              Text('There is no item'.tr)
            ],),
          ):Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                    child: Text('Type filter'.tr,style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffA1977D)),),
                  ),
                  InkWell(
                    onTap: ()=>controller.clearFilter(),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Clear filter'.tr,style: TextStyle(color: Color(0xffA1977D))),
                    ),
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: buildTypeItems(),),
            ],
          )
      ),
    );
  }

  List<Widget> buildTypeItems(){
    List<Widget> list=[];
    for(Children child in children) {
      if(checkItem.id==child.id)
        list.add(CheckItemWidget(checkItem: checkItem,returnCheckItem: onCheckChange,));
      else
      list.add(CheckItemWidget(checkItem: CheckItem(id: child.id,isCheck: false,title: child.title,),returnCheckItem: onCheckChange,));
    }
    return list;
  }
  onCheckChange(CheckItem item){
    controller.changeContentTypeIndex(item);
    Get.back();
  }
}
