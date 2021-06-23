import 'package:either_option/src/either.dart';
import 'package:wetland/core/error/failures.dart';
import 'package:wetland/core/usecase/usecase.dart';
import 'package:wetland/domain/entity/view_entity.dart';
import 'package:wetland/domain/repository/wetlands_repository.dart';

class GetViewUseCase implements UseCase<ViewEntity,Params>{
  final WetlandsRepository repository;

  GetViewUseCase({this.repository});

  @override
  Future<Either<Failure, ViewEntity>> call(Params params) {
    return repository.getView(params.value);
  }
}