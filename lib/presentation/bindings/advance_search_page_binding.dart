import 'package:get/get.dart';
import 'package:wetland/domain/usecase/get_advance_search_usecase.dart';
import 'package:wetland/domain/usecase/get_view_usecase.dart';
import 'package:wetland/presentation/controller/content_page_controller.dart';

class AdvanceSearchPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ContentPageController>(() => ContentPageController());
    Get.lazyPut<GetViewUseCase>(() => GetViewUseCase(
        repository: Get.find()
    ));
    Get.lazyPut<GetAdvanceSearchUseCase>(() => GetAdvanceSearchUseCase(
        repository: Get.find()
    ));
  }

}