
import 'package:dio/dio.dart';
import 'package:either_option/src/either.dart';
import 'package:wetland/core/config/config.dart';
import 'package:wetland/core/error/exceptions.dart';
import 'package:wetland/core/error/failures.dart';
import 'package:wetland/data/datasource/local/wetlands_local_datasource.dart';
import 'package:wetland/data/datasource/remote/wetlands_remote_datasource.dart';
import 'package:wetland/data/model/advance_search_model.dart';
import 'package:wetland/data/model/view_model.dart';
import 'package:wetland/data/model/category_model.dart';
import 'package:wetland/data/model/content_detail_model.dart';
import 'package:wetland/data/model/content_model.dart';
import 'package:wetland/domain/entity/advance_search_entity.dart';
import 'package:wetland/domain/entity/view_entity.dart';
import 'package:wetland/domain/entity/category_entity.dart';
import 'package:wetland/domain/entity/content_detail_entity.dart';
import 'package:wetland/domain/entity/content_entity.dart';
import 'package:wetland/domain/repository/wetlands_repository.dart';

class WetlandsRepositoryImpl implements WetlandsRepository{

  final WetlandsRemoteDataSource remoteDataSource;
  final WetlandsLocalDataSource localDataSource;
  WetlandsRepositoryImpl({this.remoteDataSource,this.localDataSource});

  @override
  Future<Either<Failure, CategoryEntity>> getCategories(String parameters) async {
    try{
      final response = await remoteDataSource.get<CategoryModel,Null>('front/category/list$parameters');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ViewEntity>> getView(String parameters)async {
    try{
      final response = await remoteDataSource.get<ViewModel,Null>('front/category/view?$parameters');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ContentEntity>> getCategoryContent(String parameters) async{
    try{
      final response = await remoteDataSource.get<ContentModel,Null>('front/content/list$parameters');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ContentDetailEntity>> getContentDetail(String parameters) async{
    try{
      final response = await remoteDataSource.get<ContentDetailModel,Null>('front/content/view$parameters');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, AdvanceSearchEntity>> getAdvanceSearch(String parameters) async{
    try{
      final response = await remoteDataSource.get<AdvanceSearchModel,Null>('front/search?category_id$parameters');
      return Right(response);
    }on ServerException catch(e){
      return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
    }
  }
  //
  // @override
  // Future<Either<Failure, LoginResponseEntity>> login(Map body) async{
  //   try{
  //     final response = await remoteDataSource.post <LoginResponseModel,Null>( body,'auth/login');
  //     localDataSource.saveToken(response.data.access_token);
  //     return Right(response);
  //   }on ServerException catch(e){
  //     return Left(ServerFailure(errorCode: e.errorCode,errorMessage: e.errorMessage));
  //   }
  // }
}