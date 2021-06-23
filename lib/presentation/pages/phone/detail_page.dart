import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share/share.dart';
import 'package:video_player/video_player.dart';
import 'package:wetland/core/config/config.dart';
import 'package:wetland/data/model/content_model.dart';
import 'package:wetland/presentation/controller/download_controller.dart';
import 'package:wetland/presentation/controller/main_page_controller.dart';

class DetailPage extends StatefulWidget {
  Content content;
  String category='';
  MainPageController mainPageController = Get.put(MainPageController());
  DetailPage(){
    content = Get.arguments;
    for(int i=0;i<content.category.length;i++){
      category+=mainPageController.isUs.value?content.category[i].titleEn:content.category[i].title;
      if(i+1 < content.category.length)
        category+='/';
    }
    }
    // controller.getContentDetail(parameters);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  FlickManager flickManager;
  DownLoadController controller = Get.put(DownLoadController());
  double progressValue=0;
  @override
  void dispose() {
    super.dispose();
    if(flickManager!=null)
    flickManager.dispose();
  }
  downloadProgress(double progress){
    setState(() {
      progressValue = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(

        backgroundColor: Color(0xffE16E34),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.white,),
        //   onPressed: () {
        //     Get.back();
        //     flickManager.flickControlManager.pause();
        //     flickManager.dispose();
        //   },
        // ),
      ),
      body:
      SingleChildScrollView(

        child:
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child:
              Column(children: [

                SizedBox(height: 16,),
                Row(
                  children: [
                    Text(widget.content.title,
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 16,),
                (widget.content.video != null && widget.content.video != '') ?
                FlickVideoPlayer(
                    flickManager: flickManager
                )
                    :
                (widget.content.photo != null && widget.content.photo != '')
                    ?
                Image.network(widget.content.photo, fit: BoxFit.fill,)
                    : Container()
              ],),
            ),

            Divider(),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: [
                  Expanded(child:
                  InkWell(
                    onTap: () =>
                        controller.download(widget.content.title + '.${widget.content.attachType}',
                            widget.content.attache, downloadProgress),
                    child: Container(
                      color: Colors.white,
                      child:
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child:  CircularPercentIndicator(
                                radius: 50.0,
                                lineWidth: 5.0,
                                percent: progressValue,
                                center: Icon(Icons.download_sharp, size: 20,),
                                progressColor: Colors.green,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),

                          Expanded(
                              flex: 2,
                              child: Text('Download the attached file'.tr)),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(width: 16.0,),
                  Expanded(child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: Text(
                            'Share'.tr, textAlign: TextAlign.end,)),

                          Expanded(child: IconButton(icon: Icon(Icons.share),
                              onPressed: () =>
                                  Share.share(widget.content.attache))),
                        ],
                      )))
                ],
              ),
            ),
            Divider(),
            Container(
              // color: Colors.red,
              // height: 200,
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        infoWidget('Category'.tr, widget.category),
                        SizedBox(height: 16,),
                        infoWidget('Type'.tr, widget.content.type.title),
                        SizedBox(height: 16,),
                        infoWidget('Producer'.tr, widget.content.author),
                        SizedBox(height: 16,),
                        infoWidget('Production date'.tr, widget.content.createdAt),
                        // SizedBox(height: 16.0,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(widget.content.content!=null?widget.content.content:'',style: TextStyle(height: 1.7,),textAlign: TextAlign.justify,),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget infoWidget(String title, String value) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: Text(
            title, style: TextStyle(fontWeight: FontWeight.bold),)),
          SizedBox(width: 8,),
          Expanded(flex:3,child: Text(value)),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.progress.value = '';
    controller.progressValue.value = 0;

    if (widget.content.video != null && widget.content.video != '') {
      flickManager = FlickManager(
        autoPlay: false,
        videoPlayerController:
        VideoPlayerController.network(widget.content.video),
      );
    }
  }
}



