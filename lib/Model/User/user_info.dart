class UserInfo {
  int status;
  String message;
  Data data;

  UserInfo({this.status, this.message, this.data});

  UserInfo.fromJson(Map<String, dynamic> json) {
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
  User user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String employeeNo;
  String nickname;
  String name;
  String mobile;
  String mobileWhole;
  int sex;
  String deptname;
  int createTime;
  int effdt;
  String effdtStr;
  String position;
  int userLevel;
  int userCoin;
  int userStatus;
  String label;
  int userFrontRoleId;
  int userGroupId;
  String duties;
  String hpsLocation;
  String longStoreNo;
  String userHeadImage;
  bool birthday;
  bool annual;
  double credits;
  String storeCity;

  User(
      {this.id,
      this.employeeNo,
      this.nickname,
      this.name,
      this.mobile,
      this.mobileWhole,
      this.sex,
      this.deptname,
      this.createTime,
      this.effdt,
      this.effdtStr,
      this.position,
      this.userLevel,
      this.userCoin,
      this.userStatus,
      this.label,
      this.userFrontRoleId,
      this.userGroupId,
      this.duties,
      this.hpsLocation,
      this.longStoreNo,
      this.userHeadImage,
      this.birthday,
      this.annual,
      this.credits,
      this.storeCity});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeNo = json['employeeNo'];
    nickname = json['nickname'];
    name = json['name'];
    mobile = json['mobile'];
    mobileWhole = json['mobileWhole'];
    sex = json['sex'];
    deptname = json['deptname'];
    createTime = json['createTime'];
    effdt = json['effdt'];
    effdtStr = json['effdtStr'];
    position = json['position'];
    userLevel = json['userLevel'];
    userCoin = json['userCoin'];
    userStatus = json['userStatus'];
    label = json['label'];
    userFrontRoleId = json['userFrontRoleId'];
    userGroupId = json['userGroupId'];
    duties = json['duties'];
    hpsLocation = json['hpsLocation'];
    longStoreNo = json['longStoreNo'];
    userHeadImage = json['userHeadImage'];
    birthday = json['birthday'];
    annual = json['annual'];
    credits = json['credits'];
    storeCity = json['storeCity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employeeNo'] = this.employeeNo;
    data['nickname'] = this.nickname;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['mobileWhole'] = this.mobileWhole;
    data['sex'] = this.sex;
    data['deptname'] = this.deptname;
    data['createTime'] = this.createTime;
    data['effdt'] = this.effdt;
    data['effdtStr'] = this.effdtStr;
    data['position'] = this.position;
    data['userLevel'] = this.userLevel;
    data['userCoin'] = this.userCoin;
    data['userStatus'] = this.userStatus;
    data['label'] = this.label;
    data['userFrontRoleId'] = this.userFrontRoleId;
    data['userGroupId'] = this.userGroupId;
    data['duties'] = this.duties;
    data['hpsLocation'] = this.hpsLocation;
    data['longStoreNo'] = this.longStoreNo;
    data['userHeadImage'] = this.userHeadImage;
    data['birthday'] = this.birthday;
    data['annual'] = this.annual;
    data['credits'] = this.credits;
    data['storeCity'] = this.storeCity;
    return data;
  }
}
