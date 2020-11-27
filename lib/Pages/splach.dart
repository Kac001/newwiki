import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newwiki/api/user_api.dart';
import '../Services/screen_adaper.dart';
import 'package:newwiki/services/storage/token_storage.dart';
import 'package:common_utils/common_utils.dart';

class SPlachPage extends StatefulWidget {
  SPlachPage({Key key}) : super(key: key);

  @override
  _SplachPageState createState() => _SplachPageState();
}

class _SplachPageState extends State<SPlachPage> {
  String _codeCountdownStr = "3";
  bool _countdownLock = true;
  int _countdownNum = 2;
  Timer _countdownTimer;
  Timer _splachTimer;

  @override
  void initState() {
    super.initState();
    //初始化日志
    LogUtil.init(isDebug: true, maxLen: 10000);
    //系统倒计时
    startHome();
    //跳过倒计时按钮
    recountdown();
  }

  //跳转首页和检查token
  jumpToIndex() async {
    //提取缓存token
    var token = await TokenStorage.getToken();
    //缓存token为空就跳转登陆也
    if (token == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/login", (Route route) => false);
      return;
    }
    print("启动页面获取token:" + token.toString());
    var resp = getUserInfoApi(token);
    resp.then((value) {
      if (token != null && value.status == 200) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/", (Route route) => false);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/login", (Route route) => false);
      }
    });
  }

//系统倒计时
  startHome() async {
    // await Future.delayed(const Duration(milliseconds: 5000), () {
    //   Navigator.of(context)
    //       .pushNamedAndRemoveUntil("/", (Route route) => false);
    // });
    _splachTimer = new Timer.periodic(new Duration(seconds: 5), (timer) {
      this.jumpToIndex();
    });
  }

//跳过按钮倒计时
  recountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum > 0) {
            _codeCountdownStr = '${_countdownNum--}';
          } else {
            _countdownLock = false;
            _codeCountdownStr = "跳过";
          }
        });
      });
    });
  }

  //页面销毁
  void dispose() {
    _countdownTimer.cancel();
    _countdownTimer = null;
    _splachTimer.cancel();
    _splachTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(60)),
            height: ScreenAdaper.height(1080),
            width: ScreenAdaper.width(750),
            child: Image.asset("images/splach.png")),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenAdaper.height(144),
              width: ScreenAdaper.width(460),
              margin: EdgeInsets.only(bottom: ScreenAdaper.height(40)),
              child: Image.asset(
                "images/dashenlin.png",
                fit: BoxFit.fill,
              ),
            )),
        Positioned(
          // left: 30,
          right: 10,
          // bottom: 50,
          top: 50,
          child: GestureDetector(
            child: Container(
              height: ScreenAdaper.height(40),
              width: ScreenAdaper.width(100),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(0, 0, 0, 0.4)),
              child: Text(
                _codeCountdownStr,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            onTap: () {
              if (this._countdownLock != true) {
                this.jumpToIndex();
              }
            },
          ),
        ),
      ],
    ));
  }
}
