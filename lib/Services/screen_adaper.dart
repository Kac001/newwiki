import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ScreenAdaper {
  static init(context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: true);
  }

  ///根据手机屏幕适配高度
  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  ///根据手机屏幕适配宽度
  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  // static getscreenHeight() {
  //   return ScreenUtil.screenHeight;
  // }

  // static getscreenWidth() {
  //   return ScreenUtil.screenWidth;
  // }

  ///根据手机屏幕适配文本大小
  ///传入字体大小，默认不根据系统的“字体大小”辅助选项来进行缩放
  static size(double size) {
    return ScreenUtil().setSp(size);
  }
}
