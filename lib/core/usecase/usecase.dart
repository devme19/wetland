import 'package:either_option/either_option.dart';
import 'package:wetland/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
}
// ignore: must_be_immutable
class Params {
  final Map body;
  final bool boolValue;
  final String value;
  String id;

  Params({this.body,this.boolValue,this.id,this.value});
}