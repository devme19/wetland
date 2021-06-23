import 'package:get/get.dart';
import 'package:wetland/data/datasource/local/wetlands_local_datasource.dart';
import 'package:wetland/data/datasource/remote/wetlands_remote_datasource.dart';
import 'package:wetland/data/repository/wetlands_repository_impl.dart';
import 'package:wetland/domain/repository/wetlands_repository.dart';
import 'package:wetland/domain/usecase/get_categories_usecase.dart';
import 'package:wetland/presentation/controller/main_page_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<WetlandsRemoteDataSource>(WetlandsRemoteDataSourceImpl());
    Get.put<WetlandsLocalDataSource>(WetlandsLocalDataSourceImpl());
    Get.put<WetlandsRepository>(
        WetlandsRepositoryImpl(
            remoteDataSource: Get.find(),
            localDataSource: Get.find()
        ));
    Get.lazyPut<MainPageController>(() => MainPageController());
    Get.lazyPut<GetCategoriesUseCase>(() => GetCategoriesUseCase(
      repository: Get.find()
    ));
  }

}