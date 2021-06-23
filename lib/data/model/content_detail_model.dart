
import 'package:wetland/domain/entity/content_detail_entity.dart';

class ContentDetailModel extends ContentDetailEntity{


  ContentDetailModel(
      {
        bool success,
        int code,
        String locale,
        String message,
        Data data,
}):super(
    locale: locale,
    message: message,
    success: success,
    code: code,
    data: data
  );

  ContentDetailModel.fromJson(Map<String, dynamic> json) {
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
  Content content;

  Data({this.content});

  Data.fromJson(Map<String, dynamic> json) {
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    return data;
  }
}

class Content {
  int id;
  String title;
  String alias;
  // Null content;
  String year;
  String author;
  String attache;
  String photo;
  String video;
  String createdAt;
  String updatedAt;
  int languageId;
  int typeId;
  int subtypeId;
  // Null categoryId;
  // List<Null> gallery;
  List<Category> category;
  // List<Null> tree;
  Language language;
  Type type;
  Subtype subtype;

  Content(
      {this.id,
        this.title,
        this.alias,
        // this.content,
        this.year,
        this.author,
        this.attache,
        this.photo,
        this.video,
        this.createdAt,
        this.updatedAt,
        this.languageId,
        this.typeId,
        this.subtypeId,
        // this.categoryId,
        // this.gallery,
        this.category,
        // this.tree,
        this.language,
        this.type,
        this.subtype});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    alias = json['alias'];
    // content = json['content'];
    year = json['year'];
    author = json['author'];
    attache = json['attache'];
    photo = json['photo'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    languageId = json['language_id'];
    typeId = json['type_id'];
    subtypeId = json['subtype_id'];
    // categoryId = json['category_id'];
    // if (json['gallery'] != null) {
    //   gallery = new List<Null>();
    //   json['gallery'].forEach((v) {
    //     gallery.add(new Null.fromJson(v));
    //   });
    // }
    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
    // if (json['tree'] != null) {
    //   tree = new List<Null>();
    //   json['tree'].forEach((v) {
    //     tree.add(new Null.fromJson(v));
    //   });
    // }
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    subtype =
    json['subtype'] != null ? new Subtype.fromJson(json['subtype']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['alias'] = this.alias;
    // data['content'] = this.content;
    data['year'] = this.year;
    data['author'] = this.author;
    data['attache'] = this.attache;
    data['photo'] = this.photo;
    data['video'] = this.video;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['language_id'] = this.languageId;
    data['type_id'] = this.typeId;
    data['subtype_id'] = this.subtypeId;
    // data['category_id'] = this.categoryId;
    // if (this.gallery != null) {
    //   data['gallery'] = this.gallery.map((v) => v.toJson()).toList();
    // }
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    // if (this.tree != null) {
    //   data['tree'] = this.tree.map((v) => v.toJson()).toList();
    // }
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    if (this.subtype != null) {
      data['subtype'] = this.subtype.toJson();
    }
    return data;
  }
}

class Category {
  int id;
  String title;
  String titleEn;
  String alias;
  String description;
  String descriptionEn;
  String icon;
  String image;
  String createdAt;
  String updatedAt;
  int active;

  Category(
      {this.id,
        this.title,
        this.titleEn,
        this.alias,
        this.description,
        this.descriptionEn,
        this.icon,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.active});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    alias = json['alias'];
    description = json['description'];
    descriptionEn = json['description_en'];
    icon = json['icon'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['alias'] = this.alias;
    data['description'] = this.description;
    data['description_en'] = this.descriptionEn;
    data['icon'] = this.icon;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active'] = this.active;
    return data;
  }
}

class Language {
  int id;
  String title;
  String code;
  String createdAt;
  Null updatedAt;
  int active;

  Language(
      {this.id,
        this.title,
        this.code,
        this.createdAt,
        this.updatedAt,
        this.active});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active'] = this.active;
    return data;
  }
}

class Type {
  int id;
  String title;
  String titleEn;
  String alias;
  Null parentId;
  String createdAt;
  String updatedAt;

  Type(
      {this.id,
        this.title,
        this.titleEn,
        this.alias,
        this.parentId,
        this.createdAt,
        this.updatedAt});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    alias = json['alias'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['alias'] = this.alias;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Subtype {
  int id;
  String title;
  String titleEn;
  String alias;
  int parentId;
  String createdAt;
  String updatedAt;

  Subtype(
      {this.id,
        this.title,
        this.titleEn,
        this.alias,
        this.parentId,
        this.createdAt,
        this.updatedAt});

  Subtype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    alias = json['alias'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.titleEn;
    data['alias'] = this.alias;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
