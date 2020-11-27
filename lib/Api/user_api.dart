import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:newwiki/model/user/login.dart';
import 'package:newwiki/model/user/msg_code.dart';
import 'package:newwiki/model/user/user_info.dart';
import 'package:newwiki/services/http_util.dart';
import '../config.dart';

var apiMap = {
  "login": domain + "/app/user/login.do", //登陆接口
  "msgCode": domain + "/sms/send.do", //获取短信验证码
  "userInfo": domain + "/app/user/getUser.do", //获取用户信息
};

/// 获取用户信息
/// @param token 用户密钥
Future<UserInfo> getUserInfoApi(token) async {
  var data = {"app_token": token};
  var result = await HttpUtil().get(apiMap['userInfo'], data: data);
  var resp = UserInfo.fromJson(json.decode(result.data));
  return resp;
}

/// 获取登陆token
/// @param mobile 手机号码
/// @param smsKey  加密key(dsl123+手机号码+dsl123)
Future<Login> getTokenApi(mobile, msgCode) async {
  var data = {"mobile": mobile, "code": msgCode};
  var result = await HttpUtil().get(apiMap['login'], data: data);
  var resp = Login.fromJson(json.decode(result.data));
  return resp;
}

///获取短信验证码
/// @param mobile 手机号码
/// @param smsKey  加密key(dsl123+手机号码+dsl123)
Future<Msgcode> getMsgCodeApi(mobile) async {
  var data = {
    "mobile": mobile,
    "smsKey": md5
        .convert(utf8.encode("dsl123" + mobile + "dsl123"))
        .toString()
        .toUpperCase()
  };
  var result = await HttpUtil().get(apiMap['msgCode'], data: data);
  var resp = Msgcode.fromJson(json.decode(result.data));
  return resp;
}
