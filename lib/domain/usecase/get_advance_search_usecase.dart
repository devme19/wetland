import 'package:either_option/src/either.dart';
import 'package:wetland/core/error/failures.dart';
import 'package:wetland/core/usecase/usecase.dart';
import 'package:wetland/domain/entity/advance_search_entity.dart';
import 'package:wetland/domain/repository/wetlands_repository.dart';

class GetAdvanceSearchUseCase extends UseCase<AdvanceSearchEntity,Params>{
  final WetlandsRepository repository;

  GetAdvanceSearchUseCase({this.repository});

  @override
  Future<Either<Failure, AdvanceSearchEntity>> call(Params params) {
    return repository.getAdvanceSearch(params.value);
  }
}