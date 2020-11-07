import 'package:flutter/material.dart';
import 'package:newwiki/Pages/login.dart';
import 'package:newwiki/Pages/splach.dart';
import 'Pages/index.dart';

//配置路由
final routes = {
  '/': (context) => IndexPage(),
  '/splach': (context) => SPlachPage(),
  '/login': (context) => LoginPage(),
  // '/productlist': (context, {arguments}) =>
  //     ProductListPage(arguments: arguments),
  // '/productdetail': (context, {arguments}) =>
  //     ProductDetail(arguments: arguments),
};
//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
