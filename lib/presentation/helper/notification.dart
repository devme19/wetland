import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

class LocalNotification{

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static initialize(){
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final android = AndroidInitializationSettings("@mipmap/ic_launcher");
    final iOS = IOSInitializationSettings();
    final initSettings = InitializationSettings(android:android,iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: _onSelectNotification);
  }
  static Future<void> _onSelectNotification(String json) async {
    final obj = jsonDecode(json);

    if (obj['isSuccess']) {
      OpenFile.open(obj['filePath']);
    } else {
      Get.dialog(
          Scaffold(
            body: Center(
              child: Text('${obj['error']}',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          )
      );
    }
  }
}