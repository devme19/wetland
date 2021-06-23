import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetland/core/error/failures.dart';
import 'package:wetland/core/usecase/usecase.dart';
import 'package:wetland/domain/entity/category_entity.dart';
import 'package:wetland/domain/usecase/get_categories_usecase.dart';
import 'package:wetland/presentation/helper/state_status.dart';

class MainPageController extends GetxController{
  var getCategoriesState = StateStatus.INITIAL.obs;
  Rx<CategoryEntity> categoryEntity = CategoryEntity().obs;

  RxBool isUs = false.obs;
  String lan='fa';
  Locale locale;
  changeLanguage(bool ln){
    isUs.value = ln;
    String lang;


    if(isUs.value) {
      locale = Locale('en', 'US');
      Get.updateLocale(locale);
      lan = 'en';
    } else {
      locale = Locale('fa', 'IR');
      Get.updateLocale(locale);
      lan = 'fa';
    }
    // LocalizationService().changeLocale(lang);
    getCategories();
  }
  getCategories(){
    getCategoriesState.value = StateStatus.LOADING;
    GetCategoriesUseCase getCategoriesUseCase = Get.find();
    getCategoriesUseCase.call(Params(value: '?code=$lan')).then((response){
      if(response.isRight){
        getCategoriesState.value = StateStatus.SUCCESS;
        categoryEntity.value = response.fold((_) => categoryEntity.value,(categoryEntity) => categoryEntity);
        int i = 0;
      }else if(response.isLeft){
        ServerFailure failure;
        failure = response.fold((failure) => failure,null);
        getCategoriesState.value = StateStatus.ERROR;
      }
    });
  }
}