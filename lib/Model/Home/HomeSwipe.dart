class HomeSwipe {
  int status;
  String message;
  Data data;

  HomeSwipe({this.status, this.message, this.data});

  HomeSwipe.fromJson(Map<String, dynamic> json) {
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
  List<Result> result;

  Data({this.result});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int id;
  int moduleId;
  int titleId;
  String imgPath;
  String toUrl;
  String regionType;
  int showOrder;
  int createUserId;
  int createDt;
  String endDt;

  Result(
      {this.id,
      this.moduleId,
      this.titleId,
      this.imgPath,
      this.toUrl,
      this.regionType,
      this.showOrder,
      this.createUserId,
      this.createDt,
      this.endDt});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moduleId = json['moduleId'];
    titleId = json['titleId'];
    imgPath = json['imgPath'];
    toUrl = json['toUrl'];
    regionType = json['regionType'];
    showOrder = json['showOrder'];
    createUserId = json['createUserId'];
    createDt = json['createDt'];
    endDt = json['endDt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['moduleId'] = this.moduleId;
    data['titleId'] = this.titleId;
    data['imgPath'] = this.imgPath;
    data['toUrl'] = this.toUrl;
    data['regionType'] = this.regionType;
    data['showOrder'] = this.showOrder;
    data['createUserId'] = this.createUserId;
    data['createDt'] = this.createDt;
    data['endDt'] = this.endDt;
    return data;
  }
}
