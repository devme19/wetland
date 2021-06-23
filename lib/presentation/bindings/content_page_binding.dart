import 'package:get/get.dart';
import 'package:wetland/domain/usecase/get_content_usecase.dart';
import 'package:wetland/domain/usecase/get_view_usecase.dart';
import 'package:wetland/presentation/controller/content_page_controller.dart';

class ContentPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ContentPageController>(() => ContentPageController());
    Get.lazyPut<GetViewUseCase>(() => GetViewUseCase(
      repository: Get.find()
    ));
    Get.lazyPut<GetContentUseCase>(() => GetContentUseCase(
      repository: Get.find()
    ));
  }

}