
import 'package:wetland/domain/entity/content_entity.dart';

class ContentModel extends ContentEntity{


  ContentModel(
      {
        bool success,
        int code,
        String locale,
        String message,
        Data data,
}):super(
    code: code,
    locale: locale,
    message: message,
    success: success,
    data: data
  );

  ContentModel.fromJson(Map<String, dynamic> json) {
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

class Content {
  int id;
  String title;
  String content;
  String alias;
  String year;
  String author;
  String attache;
  String attacheType;
  String photo;
  String video;
  int languageId;
  int typeId;
  Type type;
  List<Tree> tree;
  int categoryId;
  String createdAt;

  Content(
      {this.id,
        this.title,
        this.content,
        this.attacheType,
        this.alias,
        this.year,
        this.author,
        this.attache,
        this.photo,
        this.video,
        this.languageId,
        this.typeId,
        this.type,
        this.tree,
        this.categoryId,
        this.createdAt});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    alias = json['alias'];
    year = json['year'];
    author = json['author'];
    attache = json['attache'];
    attacheType = json['attache_type'];
    photo = json['photo'];
    video = json['video'];
    languageId = json['language_id'];
    typeId = json['type_id'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    if (json['tree'] != null) {
      tree = [];
      json['tree'].forEach((v) {
        tree.add(new Tree.fromJson(v));
      });
    }
    categoryId = json['category_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['alias'] = this.alias;
    data['year'] = this.year;
    data['author'] = this.author;
    data['attache'] = this.attache;
    data['photo'] = this.photo;
    data['video'] = this.video;
    data['language_id'] = this.languageId;
    data['type_id'] = this.typeId;
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    if (this.tree != null) {
      data['tree'] = this.tree.map((v) => v.toJson()).toList();
    }
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Type {
  int id;
  String title;
  String titleEn;
  Null parentId;
  String alias;
  String createdAt;
  String updatedAt;

  Type(
      {this.id,
        this.title,
        this.titleEn,
        this.parentId,
        this.alias,
        this.createdAt,
        this.updatedAt});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    parentId = json['parent_id'];
    alias = json['alias'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['parent_id'] = this.parentId;
    data['alias'] = this.alias;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Tree {
  int id;
  String title;
  String titleEn;
  String alias;
  String icon;
  String createdAt;
  String updatedAt;
  int languageId;
  Pivot pivot;

  Tree(
      {this.id,
        this.title,
        this.titleEn,
        this.alias,
        this.icon,
        this.createdAt,
        this.updatedAt,
        this.languageId,
        this.pivot});

  Tree.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    alias = json['alias'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    languageId = json['language_id'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['alias'] = this.alias;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['language_id'] = this.languageId;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int contentId;
  int treeId;

  Pivot({this.contentId, this.treeId});

  Pivot.fromJson(Map<String, dynamic> json) {
    contentId = json['content_id'];
    treeId = json['tree_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content_id'] = this.contentId;
    data['tree_id'] = this.treeId;
    return data;
  }
}

// class Category {
//   int id;
//   String title;
//   String titleEn;
//   String alias;
//   String description;
//   String descriptionEn;
//   String icon;
//   String image;
//   String createdAt;
//   String updatedAt;
//   int active;
//   Pivot pivot;
//
//   Category(
//       {this.id,
//         this.title,
//         this.titleEn,
//         this.alias,
//         this.description,
//         this.descriptionEn,
//         this.icon,
//         this.image,
//         this.createdAt,
//         this.updatedAt,
//         this.active,
//         this.pivot});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     titleEn = json['title_en'];
//     alias = json['alias'];
//     description = json['description'];
//     descriptionEn = json['description_en'];
//     icon = json['icon'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     active = json['active'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['title_en'] = this.titleEn;
//     data['alias'] = this.alias;
//     data['description'] = this.description;
//     data['description_en'] = this.descriptionEn;
//     data['icon'] = this.icon;
//     data['image'] = this.image;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['active'] = this.active;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot.toJson();
//     }
//     return data;
//   }
// }
//
// class Pivot1 {
//   int contentId;
//   int categoryId;
//
//   Pivot({this.contentId, this.categoryId});
//
//   Pivot.fromJson(Map<String, dynamic> json) {
//     contentId = json['content_id'];
//     categoryId = json['category_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['content_id'] = this.contentId;
//     data['category_id'] = this.categoryId;
//     return data;
//   }
// }
