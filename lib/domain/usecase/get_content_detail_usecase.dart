import 'package:either_option/src/either.dart';
import 'package:wetland/core/error/failures.dart';
import 'package:wetland/core/usecase/usecase.dart';
import 'package:wetland/domain/entity/content_detail_entity.dart';
import 'package:wetland/domain/repository/wetlands_repository.dart';

class GetContentDetailUseCase implements UseCase<ContentDetailEntity,Params>{
  final WetlandsRepository repository;

  GetContentDetailUseCase({this.repository});

  @override
  Future<Either<Failure, ContentDetailEntity>> call(Params params) {
   return repository.getContentDetail(params.value);
  }
}