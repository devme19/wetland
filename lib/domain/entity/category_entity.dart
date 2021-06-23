
import 'package:wetland/data/model/category_model.dart';

class CategoryEntity{
  Data data;
  int code;
  String locale;
  String message;
  bool success;

  CategoryEntity(
      {this.data, this.code, this.locale, this.message, this.success});
}