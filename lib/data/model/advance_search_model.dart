
import 'package:wetland/domain/entity/advance_search_entity.dart';

import 'content_model.dart';

class AdvanceSearchModel extends AdvanceSearchEntity{


  AdvanceSearchModel(
      {bool success,
      int code,
      String locale,
      String message,
      Data data,}):super(
    data: data,
    code: code,
    success: success,
    message: message,
    locale: locale
  );

  AdvanceSearchModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    locale = json['locale'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['locale'] = this.locale;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int page;
  int pageSize;
  String sortBy;
  int total;
  List<Content> content;

  Data({this.page, this.pageSize, this.sortBy, this.total, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['pageSize'];
    sortBy = json['sortBy'];
    total = json['total'];
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    data['sortBy'] = this.sortBy;
    data['total'] = this.total;
    if (this.content != null) {
      data['content'] = this.content.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
