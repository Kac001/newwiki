import 'dart:convert';

import 'package:newwiki/model/home/permissions_list.dart';
import 'package:newwiki/model/home/news_report.dart';

import '../../config.dart';
import '../../Model/Home/HomeSwipe.dart';
import '../../services/http_util.dart';

var apiMap = {
  "homeswipe": domain + "/app/hsowingmap/list.do", //轮播图接口
  "permissions": domain + "/app/user/listPermissions.do", //权限点接口
  "newsReport": domain + "/app/articleRepertory/rollingList.do", //参林快报
};

/// 参林快报
/// @param token 用户密钥
Future<newsReport> getnewsReportApi(token) async {
  var data = {"app_token": token};
  var result = await HttpUtil().get(apiMap['newsReport'], data: data);
  var resp = newsReport.fromJson(json.decode(result.data));
  return resp;
}

/// 获取权限点
/// @param token 用户密钥
Future<PermissionsList> getpermissionsListApi(token, {regionType = 1}) async {
  var data = {"app_token": token};
  var result = await HttpUtil().get(apiMap['permissions'], data: data);
  var resp = PermissionsList.fromJson(json.decode(result.data));
  return resp;
}

/// 获取轮播图
/// @param token 用户密钥
/// @param regionType 轮播图区域 轮播图区域		必填，上方值为1，中部值为2

Future<HomeSwipe> getHomeSwiperApi(token, {regionType = 1}) async {
  var data = {"app_token": token, "regionType": regionType};
  var result = await HttpUtil().get(apiMap['homeswipe'], data: data);
  var resp = HomeSwipe.fromJson(json.decode(result.data));
  return resp;
}
