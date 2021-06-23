import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetland/presentation/controller/language_controller.dart';
import 'package:wetland/presentation/controller/main_page_controller.dart';
class LanguageWidget extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    return
      Obx(()=>
          Container(
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
                            color: controller.isUs.value?Colors.redAccent.withOpacity(0.5):Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),

                        height: 40,
                        width: 40,
                        child:
                        Center(child: Text('En',style: TextStyle(color: controller.isUs.value?Colors.white:Colors.black,fontWeight:controller.isUs.value? FontWeight.bold:FontWeight.normal),)),
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
                            color: !controller.isUs.value?Colors.redAccent.withOpacity(0.5):Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(child: Text('فا',style: TextStyle(color: controller.isUs.value?Colors.black:Colors.white,fontWeight:controller.isUs.value? FontWeight.normal:FontWeight.bold))),
                      ),
                      onTap: ()=> controller.changeLanguage(false),
                    ),
                  ),
                ],
            ),
          ));
  }
}
