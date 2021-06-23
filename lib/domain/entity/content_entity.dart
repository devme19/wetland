
import 'package:wetland/data/model/content_model.dart';

class ContentEntity{
  bool success;
  int code;
  String locale;
  String message;
  Data data;

  ContentEntity(
      {this.success, this.code, this.locale, this.message, this.data});
}