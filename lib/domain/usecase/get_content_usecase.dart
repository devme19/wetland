import 'package:either_option/src/either.dart';
import 'package:wetland/core/error/failures.dart';
import 'package:wetland/core/usecase/usecase.dart';
import 'package:wetland/domain/entity/content_entity.dart';
import 'package:wetland/domain/repository/wetlands_repository.dart';

class GetContentUseCase implements UseCase<ContentEntity,Params>{
  final WetlandsRepository repository;

  GetContentUseCase({this.repository});

  @override
  Future<Either<Failure, ContentEntity>> call(Params params) {
   return repository.getCategoryContent(params.value);
  }
}