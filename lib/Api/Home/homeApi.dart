import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:common_utils/common_utils.dart';
import 'package:newwiki/Model/Home/PermissionsList.dart';
import 'package:newwiki/Model/Home/newsReport.dart';

import '../../config.dart';
import '../../Model/Home/HomeSwipe.dart';

var apiMap = {
  "homeswipe": domain + "/app/hsowingmap/list.do", //轮播图接口
  "permissions": domain + "/app/user/listPermissions.do", //权限点接口
  "newsReport": domain + "/app/articleRepertory/rollingList.do", //参林快报
};

/// 参林快报
/// @param token 用户密钥
Future<newsReport> getnewsReportApi(token) async {
  var data = {"app_token": token};
  var result = await Dio().get(apiMap['newsReport'], queryParameters: data);
  var resp = newsReport.fromJson(json.decode(result.data));
  LogUtil.v("getnewsReportApi响应文本" + result.data);
  LogUtil.v("getnewsReportApi传入参数" + data.toString());
  // print(result.data);
  return resp;
}

/// 获取权限点
/// @param token 用户密钥
Future<PermissionsList> getpermissionsListApi(token, {regionType = 1}) async {
  var data = {"app_token": token};
  var result = await Dio().get(apiMap['permissions'], queryParameters: data);
  var resp = PermissionsList.fromJson(json.decode(result.data));
  LogUtil.v("getpermissionsListApi响应文本" + result.data);
  LogUtil.v("getpermissionsListApi传入参数" + data.toString());
  // print(result.data);
  return resp;
}

/// 获取轮播图
/// @param token 用户密钥
/// @param regionType 轮播图区域 轮播图区域		必填，上方值为1，中部值为2

Future<HomeSwipe> getHomeSwiperApi(token, {regionType = 1}) async {
  var data = {"app_token": token, "regionType": regionType};
  var result = await Dio().get(apiMap['homeswipe'], queryParameters: data);
  var resp = HomeSwipe.fromJson(json.decode(result.data));
  LogUtil.v("getHomeSwiperApi响应文本" + result.data);
  LogUtil.v("getHomeSwiperApi传入参数" + data.toString());
  // print(result.data);
  return resp;
}
