import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMsg(
    {text = "",
    timeInSecForIosWeb = 5,
    ToastGravity gravity = ToastGravity.CENTER}) async {
  Fluttertoast.showToast(
    msg: text, //提示信息
    toastLength: Toast.LENGTH_LONG, //提示框的长短
    gravity: gravity, //提示框显示位置
    timeInSecForIosWeb: timeInSecForIosWeb, //提示框停留秒数 仅限IOS和web

    backgroundColor: Colors.grey, //提示框背景颜色
    textColor: Colors.white, //提示框文字颜色
    fontSize: 16.0, //提示框文字大小
  );
}

class ToastWidget extends StatefulWidget {
  var text = "";
  int waitingtime = 1;

  var status = "";

  ToastWidget({Key key, text, status, waitingtime}) : super(key: key);

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> {
  Timer _countdownTimer;

  @override
  Widget build(BuildContext context) {
    print("object");
    _countdownTimer =
        new Timer.periodic(new Duration(seconds: widget.waitingtime), (timer) {
      return Center(
        child: Container(
          height: 100,
          width: 100,
          color: Color.fromRGBO(244, 244, 244, 0.9),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.text,
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
      );
    });
  }
}

class listBottonLoadingWidget extends StatelessWidget {
  const listBottonLoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircularProgressIndicator(
            //   strokeWidth: 0.5,
            //   backgroundColor: Colors.black12,
            // ),
            SpinKitFadingCircle(
              color: Colors.red,
              size: 25,
            ),
            SizedBox(width: 10),
            Text(
              "奋力加载中",
              style: TextStyle(fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
