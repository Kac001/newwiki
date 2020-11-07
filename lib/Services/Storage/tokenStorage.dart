import 'dart:convert';

import 'Storage.dart';

class TokenStorage {
  static setToken(token) async {
    try {
      await Storage.setString("token", token);
    } catch (e) {}
  }

  static getToken() async {
    try {
      var result = await Storage.getString("token");
      return result;
    } catch (e) {
      //注销全局 返回login
      return "";
    }
  }

  //清空token
  static cleanToken() async {
    try {
      Storage.remove("token");
    } catch (e) {
      print("清除token数据失败");
    }
  }
}
