
import 'package:wetland/data/model/view_model.dart';
class ViewEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;

  ViewEntity(
      {this.data, this.code, this.locale, this.message, this.success});
}