import 'package:get/get.dart';
import 'package:wetland/core/usecase/usecase.dart';
import 'package:wetland/domain/entity/content_detail_entity.dart';
import 'package:wetland/domain/usecase/get_content_detail_usecase.dart';
import 'package:wetland/presentation/helper/state_status.dart';

class ContentDetailPageController extends GetxController{
  var getContentDetailState = StateStatus.INITIAL.obs;
  Rx<ContentDetailEntity> contentDetailEntity = ContentDetailEntity().obs;

  getContentDetail(String parameters){
    getContentDetailState.value = StateStatus.LOADING;
    GetContentDetailUseCase getContentDetailUseCase = Get.find();
    getContentDetailUseCase.call(Params(value: parameters)).then((response){
      if(response.isRight){
        getContentDetailState.value = StateStatus.SUCCESS;
        contentDetailEntity.value = response.fold((_) => contentDetailEntity.value,(contentDetailEntity) => contentDetailEntity);

      }else if(response.isLeft){
        getContentDetailState.value = StateStatus.ERROR;

      }
    });
  }
}