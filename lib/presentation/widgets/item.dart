import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wetland/core/config/config.dart';
import 'package:wetland/data/model/view_model.dart';
import 'package:wetland/data/model/content_model.dart';
import 'package:get/get.dart';
import 'package:wetland/presentation/controller/download_controller.dart';
import 'package:wetland/presentation/navigations/wetlands.dart';
class Item extends StatefulWidget {

  final bool isEn;
  Content content;

  Item({this.isEn,this.content});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  double progress =0;

  DownLoadController controller = Get.put(DownLoadController());

  onProgress(double prgs){
    setState(() {
      progress = prgs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(WetLandsRoutes.detailPage,arguments: widget.content);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0.2,
                blurRadius: 5,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            // border: Border.all(color: Colors.grey.shade200,width: 1),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))
        ),
        child:
        
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadius),
                        child:Image.network(widget.content.photo,fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                        child:
                    Row(
                      children: [
                        Expanded(child: Text(widget.content.title,style: TextStyle(fontWeight: FontWeight.bold,color: pColor,height: 1.4),)),
                      ],
                    )),

                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(widget.isEn? 'Date':'تاریخ تهیه',style: TextStyle(color: pColor),),
                          SizedBox(width: 8,),
                          Text(widget.content.createdAt)
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Text(widget.isEn? 'Author':'تهیه کننده',style: TextStyle(color: pColor),),
                          SizedBox(width: 8,),
                          Text(widget.content.author)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
            Divider(),
            InkWell(
              onTap: ()=>controller.download(widget.content.title+'.${widget.content.attachType}',widget.content.attache,onProgress),
              child: Container(
                // color: Colors.red,
                height: 40,
                margin: EdgeInsets.only(bottom: 8),
                // color: Colors.blue,
                child:
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 2.0,
                          percent: progress,
                          center: Icon(Icons.download_sharp,size: 20,),
                          progressColor: Colors.green.shade300,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      SizedBox(width: 16,),
                      Text('Download'.tr),
                    ],
                  ),
                ),
              ),
            )
            // Expanded(
            //   flex: 2,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               shape:RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(borderRadius),
            //                 // side: BorderSide(color: Colors.grey.shade300)
            //               ),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(16.0),
            //               child: Text(isEn?'Download':'دانلود فایل',style: TextStyle(color: Colors.white)),
            //             ),onPressed: (){
            //         }),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}