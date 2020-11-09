import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newwiki/Api/userApi.dart';
import 'package:newwiki/Common/Widget/Toast.dart';
import 'package:newwiki/Services/ScreenAdaper.dart';
import 'package:newwiki/Services/Storage/tokenStorage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //定义手机号和验证码控制器
  TextEditingController _usernameController;
  TextEditingController _msgCodeController;
  //定义用户名和验证码变量
  String _mobile;
  String _msgCode;
  //定义验证码定时器
  int _countdownNum = 60;
  String _codeCountdownStr = "发送验证码";
  Timer _countdownTimer;
  bool _countdownLock = false;
  //定义输入框焦点
  final FocusNode focusNodeUsername = FocusNode();
  final FocusNode focusNodeMsgcode = FocusNode();

  @override
  void initState() {
    super.initState();
    //监听用户和验证码输入框
    _usernameController = TextEditingController()
      ..addListener(() {
        _mobile = _usernameController.text;
      });
    _msgCodeController = TextEditingController()
      ..addListener(() {
        _msgCode = _msgCodeController.text;
      });
  }

  //请求短信验证码
  getMsgCode() async {
    if (this._mobile != "" && this._mobile.length == 11) {
      //发送验证码回调
      var resp = getMsgCodeApi(this._mobile);
      resp.then((value) {
        if (value.status == 200) {
          toastMsg(text: "短信发送成功");
        } else {
          toastMsg(text: value.message);
        }
      });
      //锁定发送验证码按钮
      setState(() {
        if (_countdownTimer != null) {
          return;
        }
        _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
          setState(() {
            if (_countdownNum > 0) {
              _countdownLock = true;
              _codeCountdownStr = '${_countdownNum--}';
            } else {
              _countdownLock = false;
              _codeCountdownStr = "发送验证码";
              _countdownNum = 60;
              _countdownTimer.cancel();
              _countdownTimer = null;
            }
          });
        });
      });
    } else {
      toastMsg(text: "手机号码输入错误");
    }
  }

  //登陆接口
  login() async {
    showLoadingDialog();
    if (this._mobile != "" &&
        this._mobile.length == 11 &&
        this._msgCode != "") {
      var resp = getTokenApi(this._mobile, this._msgCode);
      resp.then((value) {
        if (value.status == 200) {
          if (value.data.appToken != "" && value.data.ok) {
            TokenStorage.setToken(value.data.appToken);
            print("登陆成功");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/", (Route route) => false);
          } else {
            Navigator.of(context).pop();
            toastMsg(text: value.message);
          }
        } else {
          Navigator.of(context).pop();
          toastMsg(text: value.message);
        }
      });
    } else {
      Navigator.of(context).pop();
      toastMsg(text: "手机号码输入错误");
    }
  }

  //登陆Dialog
  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登陆"),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: GestureDetector(
          onTap: () {
            //点击页面全局区域关闭输入框
            setState(() {
              focusNodeUsername.unfocus();
              focusNodeMsgcode.unfocus();
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(
                      top: ScreenAdaper.height(50),
                      left: ScreenAdaper.width(70)),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "手机号码",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: ScreenAdaper.width(30)),
                          Container(
                            height: ScreenAdaper.height(60),
                            width: ScreenAdaper.width(450),
                            child: TextField(
                              //焦点
                              focusNode: focusNodeUsername,
                              controller: this._usernameController,
                              maxLength: 11,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  counterText: "", //限制maxLength带来的字数限制显示
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  fillColor: Color.fromRGBO(242, 242, 242, 1),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00FF0000))),
                                  hintText: "请输入手机号码",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00000000)),
                                  )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenAdaper.height(10),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "验证码",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: ScreenAdaper.width(60)),
                          Container(
                            height: ScreenAdaper.height(60),
                            width: ScreenAdaper.width(250),
                            child: TextField(
                              //焦点
                              focusNode: focusNodeMsgcode,
                              controller: this._msgCodeController,
                              decoration: InputDecoration(
                                  counterText: "",
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  fillColor: Color.fromRGBO(242, 242, 242, 1),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0x00FF0000))),
                                  hintText: "请输入验证码",
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0x00000000)),
                                  )),
                            ),
                          ),
                          SizedBox(width: ScreenAdaper.width(15)),
                          GestureDetector(
                            child: Container(
                                alignment: Alignment.center,
                                height: ScreenAdaper.height(50),
                                width: ScreenAdaper.width(180),
                                decoration: BoxDecoration(
                                    color: _countdownLock
                                        ? Colors.grey.shade500
                                        : Color.fromRGBO(0, 186, 71, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                child: GestureDetector(
                                  child: Text(
                                    _codeCountdownStr,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                            onTap: () {
                              if (_countdownLock == false) {
                                getMsgCode();
                              }
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenAdaper.height(30),
                      ),
                      GestureDetector(
                        child: Container(
                            alignment: Alignment.center,
                            height: ScreenAdaper.height(70),
                            width: ScreenAdaper.width(600),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 186, 71, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: GestureDetector(
                              child: Text(
                                "登陆",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )),
                        onTap: () {
                          setState(() {
                            login();
                          });
                        },
                      ),
                      SizedBox(
                        height: ScreenAdaper.height(10),
                      ),
                      GestureDetector(
                        child: Text("注册申请账号",
                            style: TextStyle(
                                color: Color.fromRGBO(74, 144, 226, 1))),
                      )
                    ],
                  )),
              Positioned(
                bottom: 50,
                child: Text("版本号：V4.0.0(2020092702)"),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      "images/login.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
