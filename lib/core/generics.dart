
import 'package:wetland/data/model/advance_search_model.dart';
import 'package:wetland/data/model/category_model.dart';
import 'package:wetland/data/model/content_detail_model.dart';
import 'package:wetland/data/model/content_model.dart';
import 'package:wetland/data/model/view_model.dart';

class Generics {
  static T fromJson<T,K>(dynamic json) {
    print(T);
    print(K);
    if (json is Iterable) {
      return _fromJsonList<K>(json) as T;
    }
    else
    if (T == CategoryModel) {
      return CategoryModel.fromJson(json) as T;
    }
    else
    if (T == ViewModel) {
      return ViewModel.fromJson(json) as T;
    }
    else
    if (T == ContentModel) {
      return ContentModel.fromJson(json) as T;
    }
    else
    if (T == ContentDetailModel) {
      return ContentDetailModel.fromJson(json) as T;
    }
    else
    if (T == AdvanceSearchModel) {
      return AdvanceSearchModel.fromJson(json) as T;
    }
    else
      {
        throw Exception("Unknown class");
      }

  }
  static List<K> _fromJsonList<K>(List jsonList) {
    if (jsonList == null) {
      return null;
    }

    List<K> output = List();

    for (Map<String, dynamic> json in jsonList) {
      output.add(fromJson(json));
    }
    return output;
  }
}