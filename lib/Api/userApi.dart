import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flustars/flustars.dart';
import 'package:newwiki/Model/User/login.dart';
import 'package:newwiki/Model/User/msgCode.dart';
import 'package:newwiki/Model/User/userInfo.dart';
import '../config.dart';

var apiMap = {
  "login": domain + "/app/user/login.do", //登陆接口
  "msgCode": domain + "/sms/send.do", //获取短信验证码
  "userInfo": domain + "/app/user/getUser.do", //获取用户信息
};

/// 获取用户信息
/// @param token 用户密钥
Future<UserInfo> getUserInfoApi(token) async {
  try {
    var data = {"app_token": token};
    var result = await Dio().get(apiMap['userInfo'], queryParameters: data);
    var resp = UserInfo.fromJson(json.decode(result.data));
    LogUtil.v("getUserInfoApi传入参数" + data.toString());
    LogUtil.v("getUserInfoApi响应文本" + result.data);
    return resp;
  } catch (e) {
    print("object");
  }
}

/// 获取登陆token
/// @param mobile 手机号码
/// @param smsKey  加密key(dsl123+手机号码+dsl123)
Future<Login> getTokenApi(mobile, msgCode) async {
  var data = {"mobile": mobile, "code": msgCode};
  var result = await Dio().get(apiMap['login'], queryParameters: data);
  var resp = Login.fromJson(json.decode(result.data));
  LogUtil.v("getUserInfoApi传入参数" + data.toString());
  LogUtil.v("getUserInfoApi响应文本" + result.data);
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
  var result = await Dio().get(apiMap['msgCode'], queryParameters: data);
  var resp = Msgcode.fromJson(json.decode(result.data));
  LogUtil.v("getUserInfoApi传入参数" + data.toString());
  LogUtil.v("getUserInfoApi响应文本" + result.data);
  return resp;
}
