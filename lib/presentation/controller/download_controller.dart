import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:wetland/data/client.dart';
import 'package:wetland/presentation/helper/notification.dart';
//https://www.evertop.pl/en/how-to-write-a-simple-downloading-app-with-flutter/

class DownLoadController extends GetxController{
  RxString progress=''.obs;
  RxDouble progressValue = 0.0.obs;
  ValueChanged<double> onProgress;
  RxBool isDownloading = false.obs;

  @override
  void dispose() {

  }

  Map<String, dynamic> result = {
    'isSuccess': false,
    'filePath': null,
    'error': null,
  };

  Future<void> _startDownload(String savePath,String _fileUrl) async {
    isDownloading.value =true;
    try{
      final response = await Client.dio.download(
          _fileUrl,
          savePath,
          onReceiveProgress: _onReceiveProgress
      );
      result['isSuccess'] = response.statusCode == 200;
      result['filePath'] = savePath;
    }catch (ex) {
      result['error'] = ex.toString();
    } finally {
      isDownloading.value = false;
      await _showNotification(result);
    }
  }
  Future<void> download(String _fileName,String url,ValueChanged<double> progressAction) async {
    onProgress = progressAction;
    final isPermissionStatusGranted = await _requestPermissions();
    Directory downloadDir = await _getDownloadDirectory();
    Directory downloadWithAppDir = Directory('${downloadDir.path}/Talab Downloads/');
    String saveDirectory;
    if(await downloadWithAppDir.exists())//if folder already exists return path
      saveDirectory = downloadWithAppDir.path;
    else{//if folder not exists create folder and then return its path
      final Directory saveDir=await downloadWithAppDir.create(recursive: true);
      saveDirectory = saveDir.path;
    }
    if (isPermissionStatusGranted) {
      final savePath = path.join(saveDirectory, _fileName);
      await _startDownload(savePath,url);
    } else {
      // handle the scenario when user declines the permissions
    }
  }
  Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await DownloadsPathProvider.downloadsDirectory;
    }

    // in this example we are using only Android and iOS so I can assume
    // that you are not trying it for other platforms and the if statement
    // for iOS is unnecessary

    // iOS directory visible to user
    return await getApplicationDocumentsDirectory();
  }
  Future<bool> _requestPermissions() async {
    var permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    }

    return permission == PermissionStatus.granted;
  }
  void _onReceiveProgress(int received, int total) {
    if (total != -1) {
      progressValue.value = received / total;
      if(onProgress!=null) onProgress(progressValue.value);
      progress.value = (received / total * 100).toStringAsFixed(0);
    }
  }

  Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
    final android = AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        priority: Priority.high,
        importance: Importance.max
    );
    final iOS = IOSNotificationDetails();
    final platform = NotificationDetails(android:android,iOS:iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];
    await LocalNotification.flutterLocalNotificationsPlugin.show(
        0, // notification id
        'Wetlands'.tr,
        // isSuccess ? 'Success' : 'Failure',
        isSuccess ? 'Downloaded'.tr : 'Download failed'.tr,
        platform,
        payload: json
    );
  }
}