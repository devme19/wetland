import 'package:either_option/either_option.dart';
import 'package:wetland/core/error/failures.dart';
import 'package:wetland/domain/entity/advance_search_entity.dart';
import 'package:wetland/domain/entity/category_entity.dart';
import 'package:wetland/domain/entity/content_detail_entity.dart';
import 'package:wetland/domain/entity/content_entity.dart';
import 'package:wetland/domain/entity/view_entity.dart';

abstract class WetlandsRepository{

  Future<Either<Failure,CategoryEntity>> getCategories(String parameters);
  Future<Either<Failure,ViewEntity>> getView(String parameters);
  Future<Either<Failure,ContentEntity>> getCategoryContent(String parameters);
  Future<Either<Failure,ContentDetailEntity>> getContentDetail(String parameters);
  Future<Either<Failure,AdvanceSearchEntity>> getAdvanceSearch(String parameters);

}