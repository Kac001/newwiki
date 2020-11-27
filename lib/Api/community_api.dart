import 'dart:convert';

import 'package:newwiki/services/http_util.dart';

import '../config.dart';
import '../Model/community/activity.dart';

var apiMap = {
  "activity": domain + "/app/activity/list.do", //活动接口
};

/// 获取活动信息
/// @param token 用户密钥
Future<Activity> getActivityApi(token) async {
  var data = {"app_token": token, "pageNum": 1, "whereStr": "normalTime"};
  var result = await HttpUtil().get(apiMap['activity'], data: data);
  var resp = Activity.fromJson(json.decode(result.data));
  return resp;
}
