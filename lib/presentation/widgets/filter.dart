import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetland/core/config/config.dart';
import 'package:wetland/presentation/controller/content_page_controller.dart';
class FilterWidget extends StatelessWidget {
  String text;
  bool active;
  int num;
  ValueChanged<int> parentAction;
  FilterWidget({this.text,this.active,this.num,this.parentAction});
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          parentAction(num);
        },
        child: Opacity(
          opacity: active?1:0.5,
          child: Container(
            // color: Colors.red,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(text,style: TextStyle(color: pColor,fontSize: active?18:13),),
                active?Container(color: pColor,height: 1,width: 100,):Container()
              ],
            ),
          ),
        ),
      );
  }
}
