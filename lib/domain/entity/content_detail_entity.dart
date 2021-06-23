
import 'package:wetland/data/model/content_detail_model.dart';

class ContentDetailEntity{
  bool success;
  int code;
  String locale;
  String message;
  Data data;

  ContentDetailEntity(
      {this.success, this.code, this.locale, this.message, this.data});
}