class Login {
  int status;
  String message;
  Data data;

  Login({this.status, this.message, this.data});

  Login.fromJson(Map<String, dynamic> json) {
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
  String appToken;
  bool ok;

  Data({this.appToken, this.ok});

  Data.fromJson(Map<String, dynamic> json) {
    appToken = json['app_token'];
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_token'] = this.appToken;
    data['ok'] = this.ok;
    return data;
  }
}
