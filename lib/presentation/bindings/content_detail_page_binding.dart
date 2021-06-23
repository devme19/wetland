import 'package:get/get.dart';
import 'package:wetland/presentation/controller/download_controller.dart';

class ContentDetailPageBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut<GetContentDetailUseCase>(() => GetContentDetailUseCase(
    //   repository: Get.find()
    // ));
    Get.lazyPut<DownLoadController>(() => DownLoadController());
  }

}