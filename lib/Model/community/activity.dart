class Activity {
  int status;
  String message;
  Data data;

  Activity({this.status, this.message, this.data});

  Activity.fromJson(Map<String, dynamic> json) {
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
  bool next;
  int total;
  int pageSize;
  List<ListItem> list;
  int pageNum;

  Data({this.next, this.total, this.pageSize, this.list, this.pageNum});

  Data.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    total = json['total'];
    pageSize = json['pageSize'];
    if (json['list'] != null) {
      list = new List<ListItem>();
      json['list'].forEach((v) {
        list.add(new ListItem.fromJson(v));
      });
    }
    pageNum = json['pageNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next'] = this.next;
    data['total'] = this.total;
    data['pageSize'] = this.pageSize;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['pageNum'] = this.pageNum;
    return data;
  }
}

class ListItem {
  int id;
  String activityTitle;
  String activityIntroduction;
  String frontImgPath;
  String activityContent;
  String isShare;
  int browseNum;
  String activityContentType;
  String acStartTimeStr;
  String acEndTimeStr;
  int dzCount;
  int replyCount;
  String userName;
  String userHeadImage;
  String hotFlag;
  String newFlag;
  String isTop;
  String dzFlag;
  Object activityStartTime;
  Object activityEndTime;

  ListItem(
      {this.id,
      this.activityTitle,
      this.activityIntroduction,
      this.frontImgPath,
      this.activityContent,
      this.isShare,
      this.browseNum,
      this.activityContentType,
      this.acStartTimeStr,
      this.acEndTimeStr,
      this.dzCount,
      this.replyCount,
      this.userName,
      this.userHeadImage,
      this.hotFlag,
      this.newFlag,
      this.isTop,
      this.dzFlag,
      this.activityStartTime,
      this.activityEndTime});

  ListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activityTitle = json['activityTitle'];
    activityIntroduction = json['activityIntroduction'];
    frontImgPath = json['frontImgPath'];
    activityContent = json['activityContent'];
    isShare = json['isShare'];
    browseNum = json['browseNum'];
    activityContentType = json['activityContentType'];
    acStartTimeStr = json['acStartTimeStr'];
    acEndTimeStr = json['acEndTimeStr'];
    dzCount = json['dzCount'];
    replyCount = json['replyCount'];
    userName = json['userName'];
    userHeadImage = json['userHeadImage'];
    hotFlag = json['hotFlag'];
    newFlag = json['newFlag'];
    isTop = json['isTop'];
    dzFlag = json['dzFlag'];
    activityStartTime = json['activityStartTime'];
    activityEndTime = json['activityEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activityTitle'] = this.activityTitle;
    data['activityIntroduction'] = this.activityIntroduction;
    data['frontImgPath'] = this.frontImgPath;
    data['activityContent'] = this.activityContent;
    data['isShare'] = this.isShare;
    data['browseNum'] = this.browseNum;
    data['activityContentType'] = this.activityContentType;
    data['acStartTimeStr'] = this.acStartTimeStr;
    data['acEndTimeStr'] = this.acEndTimeStr;
    data['dzCount'] = this.dzCount;
    data['replyCount'] = this.replyCount;
    data['userName'] = this.userName;
    data['userHeadImage'] = this.userHeadImage;
    data['hotFlag'] = this.hotFlag;
    data['newFlag'] = this.newFlag;
    data['isTop'] = this.isTop;
    data['dzFlag'] = this.dzFlag;
    data['activityStartTime'] = this.activityStartTime;
    data['activityEndTime'] = this.activityEndTime;
    return data;
  }
}
