import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wetland/core/error/failures.dart';
import 'package:wetland/core/usecase/usecase.dart';
import 'package:wetland/data/model/content_model.dart';
import 'package:wetland/data/model/view_model.dart' as view;
import 'package:wetland/domain/entity/advance_search_entity.dart';
import 'package:wetland/domain/entity/view_entity.dart';
import 'package:wetland/domain/entity/content_entity.dart';
import 'package:wetland/domain/usecase/get_advance_search_usecase.dart';
import 'package:wetland/domain/usecase/get_view_usecase.dart';
import 'package:wetland/domain/usecase/get_content_usecase.dart';
import 'package:wetland/presentation/helper/check_item.dart';
import 'package:wetland/presentation/helper/state_status.dart';
import 'package:wetland/presentation/widgets/empty_widget.dart';
import 'package:wetland/presentation/widgets/type_widget.dart';

class ContentPageController extends GetxController{
  RxBool isGrid = true.obs;
  RxString searchTxt = ''.obs;
  RxString advanceSearchTxt = ''.obs;
  RxString authorSearchTxt = ''.obs;
  RxString selectedYear = ''.obs;
  RxString selectedYearParam = ''.obs;
  RxString treeParam = ''.obs;
  RxInt selectedTabIndex = 0.obs;
  RxString langParam = ''.obs;
    Rx<ScrollController> scrollController = ScrollController().obs;
  Rx<ViewEntity> viewEntity = ViewEntity().obs;
  Rx<ContentEntity> contentEntity = ContentEntity().obs;
  Rx<AdvanceSearchEntity> advanceSearchEntity = AdvanceSearchEntity().obs;
  var getViewState = StateStatus.INITIAL.obs;
  var getContentState = StateStatus.INITIAL.obs;
  var getAdvanceSearchContentState = StateStatus.INITIAL.obs;
  RxString parameters=''.obs;
  List<String> typeId=[];
  RxBool contentLangIsEn = false.obs;
  List<Widget> types=[];
  List<int> contentTypeId=[];
  CheckItem selectedTypeItem=CheckItem();
  RxString selectedTypeId=''.obs;
  bool isEn = false;
  // List<view.Tree> selectedTree =[];
  RxList<view.Tree> selectedTree =<view.Tree>[].obs;
  String search,authorTxt;
  RxList contentList=[].obs;
  RxList advanceSearchContentList=[].obs;
  scrollToTop(){
    scrollController.value.animateTo(
        scrollController.value.position.minScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }
  scrollToBottom(){
    scrollController.value.animateTo(
        scrollController.value.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn);
  }
  getView(String id){
    getViewState.value = StateStatus.LOADING;
    GetViewUseCase getViewUseCase = Get.find();
    String params;
    if(isEn)
      params = 'code=en';
    else
      params = '?code=fa';
    if(id != '')
      params += '&id=$id';
    getViewUseCase.call(Params(value: params)).then((response) {
      if(response.isRight){
        typeId.clear();
        getViewState.value = StateStatus.SUCCESS;
        viewEntity.value = response.fold((_) => viewEntity.value,(viewEntity) => viewEntity);
        if(viewEntity.value.data.info != null)
          parameters.value = '?category_id='+viewEntity.value.data.info.alias+'&type_id=all';
        typeId.add('all');
        createTypeList(-1);
        for(int i=0; i<viewEntity.value.data.type.length;i++)
          typeId.add(viewEntity.value.data.type[i].id.toString());
      }else if(response.isLeft){
        getViewState.value = StateStatus.ERROR;
        ServerFailure failure;
        failure = response.fold((failure) => failure,null);
      }
    });
  }
  getContent(String parameter,ValueChanged<ContentEntity> parentAction,int index){
    getContentState.value = StateStatus.LOADING;
    GetContentUseCase getContentUseCase = Get.find();
    getContentUseCase.call(Params(value: parameter)).then((response) {
      if(response.isRight){
        getContentState.value = StateStatus.SUCCESS;
        contentEntity.value = response.fold((_) => contentEntity.value,(contentEntity) => contentEntity);
        parentAction(contentEntity.value);
        contentList.addAll(contentEntity.value.data.content);

      }else if(response.isLeft){
        getContentState.value = StateStatus.ERROR;
      }
    });
  }
  getAdvanceSearchContent(String parameter,ValueChanged<AdvanceSearchEntity> parentAction,int index){
    getContentState.value = StateStatus.LOADING;
    GetAdvanceSearchUseCase getAdvanceSearchUseCase = Get.find();
    getAdvanceSearchUseCase.call(Params(value: parameter)).then((response) {
      if(response.isRight){
        getContentState.value = StateStatus.SUCCESS;
        advanceSearchEntity.value = response.fold((_) => advanceSearchEntity.value,(advanceSearchEntity) => advanceSearchEntity);
        parentAction(advanceSearchEntity.value);
        advanceSearchContentList.addAll(advanceSearchEntity.value.data.content);

      }else if(response.isLeft){
        getContentState.value = StateStatus.ERROR;
      }
    });
  }
  clearAdvanceSearchFilters(){
    treeParam.value='';
    selectedYearParam.value ='';
    authorSearchTxt.value ='';
    advanceSearchTxt.value='';
    search='';
    authorTxt = '';
    selectedTree.clear();
    selectedYear.value='';
  }
  selectTab(int index,ValueChanged<Widget> parentAction){
    parentAction(types[index]);
    selectedTypeId.value = '';
    selectedTypeItem=CheckItem();
    String alias;
    if(index>=0 && index<typeId.length){
      selectedTabIndex.value = index;
      if(viewEntity.value.data.info!=null) {
        alias = viewEntity.value.data.info.alias;
        parameters.value = '?category_id='+alias+'&type_id='+typeId[index];
      }
      else
        if(index ==0)
          parameters.value = '';
        else
          parameters.value = '&type_id='+typeId[index];
    }
  }
  changeLanguage(bool ln){
    contentLangIsEn.value = ln;
    if(contentLangIsEn.value){
      langParam.value = '&language_id=en';
      isEn = true;
    }else
      langParam.value = '&language_id=fa';
    isEn= false;
  }

  Widget createTypeList(int index){
    types.clear();
    types.add(Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('asset/lottie/emptyStatus.json',height: 100,width: 100),
            Text('There is no item'.tr)
          ],
        )));
    for(int i=0; i<viewEntity.value.data.type.length;i++){
      types.add(TypeWidget(children: viewEntity.value.data.type[i].children,checkItem: selectedTypeItem,));
    }
    return index!=-1?types[index]:Container();
  }
  changeContentTypeIndex(CheckItem item){
    selectedTypeId.value = '&type_id=${item.id}';
    selectedTypeItem = item;
  }
  clearFilter(){
    selectedTypeItem=CheckItem();
    selectedTypeId.value='';
    Get.back();
  }
}