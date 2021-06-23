import 'package:either_option/src/either.dart';
import 'package:wetland/core/error/failures.dart';
import 'package:wetland/core/usecase/usecase.dart';
import 'package:wetland/domain/entity/category_entity.dart';
import 'package:wetland/domain/repository/wetlands_repository.dart';

class GetCategoriesUseCase implements UseCase<CategoryEntity,Params>{
  final WetlandsRepository repository;

  GetCategoriesUseCase({this.repository});

  @override
  Future<Either<Failure, CategoryEntity>> call(Params params) {
    return repository.getCategories(params.value);
  }
}