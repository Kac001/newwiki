class newsReport {
  int status;
  String message;
  Data data;

  newsReport({this.status, this.message, this.data});

  newsReport.fromJson(Map<String, dynamic> json) {
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
  List<newsReportResult> result;

  Data({this.result});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<newsReportResult>();
      json['result'].forEach((v) {
        result.add(new newsReportResult.fromJson(v));
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

class newsReportResult {
  int id;
  String articleTitle;
  String frontImgPath;
  String articleContentType;
  String articleContent;
  String articleState;
  String isTop;
  int userId;
  String userName;
  int createDt;
  int browseNum;
  String articleTag;
  String dzFlag;
  String createDtStr;
  int commentCount;
  int dzCount;
  int isShare;

  newsReportResult(
      {this.id,
      this.articleTitle,
      this.frontImgPath,
      this.articleContentType,
      this.articleContent,
      this.articleState,
      this.isTop,
      this.userId,
      this.userName,
      this.createDt,
      this.browseNum,
      this.articleTag,
      this.dzFlag,
      this.createDtStr,
      this.commentCount,
      this.dzCount,
      this.isShare});

  newsReportResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleTitle = json['articleTitle'];
    frontImgPath = json['frontImgPath'];
    articleContentType = json['articleContentType'];
    articleContent = json['articleContent'];
    articleState = json['articleState'];
    isTop = json['isTop'];
    userId = json['userId'];
    userName = json['userName'];
    createDt = json['createDt'];
    browseNum = json['browseNum'];
    articleTag = json['articleTag'];
    dzFlag = json['dzFlag'];
    createDtStr = json['createDtStr'];
    commentCount = json['commentCount'];
    dzCount = json['dzCount'];
    isShare = json['isShare'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleTitle'] = this.articleTitle;
    data['frontImgPath'] = this.frontImgPath;
    data['articleContentType'] = this.articleContentType;
    data['articleContent'] = this.articleContent;
    data['articleState'] = this.articleState;
    data['isTop'] = this.isTop;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['createDt'] = this.createDt;
    data['browseNum'] = this.browseNum;
    data['articleTag'] = this.articleTag;
    data['dzFlag'] = this.dzFlag;
    data['createDtStr'] = this.createDtStr;
    data['commentCount'] = this.commentCount;
    data['dzCount'] = this.dzCount;
    data['isShare'] = this.isShare;
    return data;
  }
}
