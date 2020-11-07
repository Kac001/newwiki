import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:common_utils/common_utils.dart';

import '../config.dart';
import '../Model/community/activity.dart';

var apiMap = {
  "activity": domain + "/app/activity/list.do", //活动接口
};

/// 获取活动信息
/// @param token 用户密钥

Future<Activity> getActivityApi(token) async {
  var data = {"app_token": token, "pageNum": 1, "whereStr": "normalTime"};
  var result = await Dio().get(apiMap['activity'], queryParameters: data);
  var resp = Activity.fromJson(json.decode(result.data));
  LogUtil.v("getActivityApi响应文本" + result.data);
  LogUtil.v("getActivityApi传入参数" + data.toString());
  return resp;
}
