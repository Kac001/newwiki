class PermissionsList {
  int status;
  String message;
  Data data;

  PermissionsList({this.status, this.message, this.data});

  PermissionsList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int tored;
  List<Permissions> permissions;

  Data({this.tored, this.permissions});

  Data.fromJson(Map<String, dynamic> json) {
    tored = json['tored'];
    if (json['permissions'] != null) {
      permissions = new List<Permissions>();
      json['permissions'].forEach((v) {
        permissions.add(new Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tored'] = this.tored;
    if (this.permissions != null) {
      data['permissions'] = this.permissions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Permissions {
  String code;
  int targetId;
  String uri;
  String imgPath;
  int orderNum;
  bool unReadState;
  String name;
  int id;

  Permissions(
      {this.code,
      this.targetId,
      this.uri,
      this.imgPath,
      this.orderNum,
      this.unReadState,
      this.name,
      this.id});

  Permissions.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    targetId = json['targetId'];
    uri = json['uri'];
    imgPath = json['imgPath'];
    orderNum = json['orderNum'];
    unReadState = json['unReadState'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['targetId'] = this.targetId;
    data['uri'] = this.uri;
    data['imgPath'] = this.imgPath;
    data['orderNum'] = this.orderNum;
    data['unReadState'] = this.unReadState;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
