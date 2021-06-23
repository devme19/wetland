
import 'package:wetland/domain/entity/view_entity.dart';

class ViewModel extends ViewEntity{
    ViewModel(
        {
            bool success,
            int code,
            String locale,
            String message,
            Data data,
}):super(data: data,success: success,message: message,locale: locale,code: code);

    ViewModel.fromJson(Map<String, dynamic> json) {
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
    Info info;
    List<Type> type;
    List<Tree> tree;

    Data({this.info, this.type, this.tree});

    Data.fromJson(Map<String, dynamic> json) {
        info = json['info'] != null ? new Info.fromJson(json['info']) : null;
        if (json['type'] != null) {
            type = [];
            json['type'].forEach((v) {
                type.add(new Type.fromJson(v));
            });
        }
        if (json['tree'] != null) {
            tree = [];
            json['tree'].forEach((v) {
                tree.add(new Tree.fromJson(v));
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.info != null) {
            data['info'] = this.info.toJson();
        }
        if (this.type != null) {
            data['type'] = this.type.map((v) => v.toJson()).toList();
        }
        if (this.tree != null) {
            data['tree'] = this.tree.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Info {
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

    Info(
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

    Info.fromJson(Map<String, dynamic> json) {
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

class Type {
    int id;
    String title;
    String titleEn;
    Null parentId;
    String alias;
    String createdAt;
    String updatedAt;
    List<Children> children;

    Type(
        {this.id,
            this.title,
            this.titleEn,
            this.parentId,
            this.alias,
            this.createdAt,
            this.updatedAt,
            this.children});

    Type.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        title = json['title'];
        titleEn = json['title_en'];
        parentId = json['parent_id'];
        alias = json['alias'];
        createdAt = json['created_at'];
        updatedAt = json['updated_at'];
        if (json['children'] != null) {
            children = [];
            json['children'].forEach((v) {
                children.add(new Children.fromJson(v));
            });
        }
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
        if (this.children != null) {
            data['children'] = this.children.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Children {
    int id;
    String title;
    String titleEn;
    int parentId;
    String alias;
    String createdAt;
    String updatedAt;
    List<Null> children;

    Children(
        {this.id,
            this.title,
            this.titleEn,
            this.parentId,
            this.alias,
            this.createdAt,
            this.updatedAt,
            this.children});

    Children.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        title = json['title'];
        titleEn = json['title_en'];
        parentId = json['parent_id'];
        alias = json['alias'];
        createdAt = json['created_at'];
        updatedAt = json['updated_at'];
        // if (json['children'] != null) {
        //     children = new List<Null>();
        //     json['children'].forEach((v) {
        //         children.add(new Null.fromJson(v));
        //     });
        // }
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
        // if (this.children != null) {
        //     data['children'] = this.children.map((v) => v.toJson()).toList();
        // }
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

    Tree(
        {this.id,
            this.title,
            this.titleEn,
            this.alias,
            this.icon,
            this.createdAt,
            this.updatedAt,
            this.languageId});

    Tree.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        title = json['title'];
        titleEn = json['title_en'];
        alias = json['alias'];
        icon = json['icon'];
        createdAt = json['created_at'];
        updatedAt = json['updated_at'];
        languageId = json['language_id'];
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
        return data;
    }
}
