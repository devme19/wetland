import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class WetlandsBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText('Iran Wetlands Protection Plan'.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),maxLines: 1,textAlign: TextAlign.center),
        // FittedBox(child: Text('Tablet ${Get.width / 3}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        SizedBox(height: 15,),
        AutoSizeText('Preserving wetlands for the people,for nature'.tr,style: TextStyle(color: Colors.white,fontSize: 8),maxLines: 1,textAlign: TextAlign.center,)
      ],
    );
  }
}
