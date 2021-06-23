
import 'package:wetland/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity{
    CategoryModel({
      Data data,
      int code,
      String locale,
      String message,
      bool success,
      }):super(
      locale: locale,
      message: message,
      success: success,
      code: code,
      data: data
      );

    factory CategoryModel.fromJson(Map<String, dynamic> json) {
        return CategoryModel(
            data: json['data'] != null ? Data.fromJson(json['data']) : null,
            code: json['code'], 
            locale: json['locale'], 
            message: json['message'], 
            success: json['success'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['locale'] = this.locale;
        data['message'] = this.message;
        data['success'] = this.success;
        data['data'] = this.data;
        return data;
    }
}

class Data {
    List<Category> category;
    int page;
    int pageSize;
    String sortBy;
    int total;

    Data({this.category, this.page, this.pageSize, this.sortBy, this.total});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            category: json['category'] != null ? (json['category'] as List).map((i) => Category.fromJson(i)).toList() : null, 
            page: json['page'], 
            pageSize: json['pageSize'], 
            sortBy: json['sortBy'], 
            total: json['total'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['page'] = this.page;
        data['pageSize'] = this.pageSize;
        data['sortBy'] = this.sortBy;
        data['total'] = this.total;
        if (this.category != null) {
            data['category'] = this.category.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Category {
    String alias;
    String created_at;
    String description;
    String icon;
    int id;
    String image;
    String title;
    String updated_at;

    Category({this.alias, this.created_at, this.description, this.icon, this.id, this.image, this.title, this.updated_at});

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            alias: json['alias'], 
            created_at: json['created_at'], 
            description: json['description'], 
            icon: json['icon'], 
            id: json['id'], 
            image: json['image'], 
            title: json['title'], 
            updated_at: json['updated_at'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alias'] = this.alias;
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['icon'] = this.icon;
        data['id'] = this.id;
        data['image'] = this.image;
        data['title'] = this.title;
        data['updated_at'] = this.updated_at;
        return data;
    }
}