
import 'package:wetland/data/model/advance_search_model.dart';

class AdvanceSearchEntity {
  bool success;
  int code;
  String locale;
  String message;
  Data data;

  AdvanceSearchEntity(
      {this.success, this.code, this.locale, this.message, this.data});
}