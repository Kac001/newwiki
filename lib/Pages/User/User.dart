import 'package:flutter/material.dart';
import 'package:newwiki/Api/userApi.dart';
import 'package:newwiki/model/user/user_info.dart';
import 'package:newwiki/services/screen_adaper.dart';
import 'package:newwiki/services/storage/token_storage.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin {
  List<User> userinfo = [];
  @override
  void initState() {
    getUserInfo();

    // TODO: implement initState
    super.initState();
  }

  getUserInfo() async {
    var token = await TokenStorage.getToken();
    var resp = getUserInfoApi(token);
    resp.then((value) {
      // print(value.status);
      setState(() {
        userinfo.add(value.data.user);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color.fromRGBO(242, 242, 242, 1),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  left: ScreenAdaper.height(20),
                  right: ScreenAdaper.height(20)),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: ScreenAdaper.height(80),
                                  width: ScreenAdaper.width(80),
                                  child: CircleAvatar(
                                    backgroundImage: this.userinfo.length > 0
                                        ? this.userinfo[0].userHeadImage != ""
                                            ? NetworkImage(
                                                this.userinfo[0].userHeadImage)
                                            : AssetImage("images/person.jpg")
                                        : AssetImage("images/person.jpg"),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenAdaper.width(10),
                                ),
                                Text(
                                  this.userinfo.length > 0
                                      ? this.userinfo[0].name
                                      : "",
                                  style: TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: ScreenAdaper.height(10),
                                      right: ScreenAdaper.height(10)),
                                  child: Icon(Icons.storefront),
                                ),
                                Text(
                                  this.userinfo.length > 0
                                      ? this.userinfo[0].deptname
                                      : "",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: ScreenAdaper.height(10),
                                      right: ScreenAdaper.height(10)),
                                  child: Icon(Icons.person),
                                ),
                                Text(
                                  this.userinfo.length > 0
                                      ? this.userinfo[0].employeeNo
                                      : "",
                                  style: TextStyle(fontSize: 17),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: ScreenAdaper.height(80),
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          height: ScreenAdaper.height(45),
                          width: ScreenAdaper.width(45),
                          child: Image.asset("images/User/wallet.png"),
                        ),
                        SizedBox(width: ScreenAdaper.width(10)),
                        Text(
                          "积分",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      this.userinfo.length > 0
                          ? this.userinfo[0].userCoin.toString() + "分"
                          : "NaN" + "分",
                      style: TextStyle(
                          fontSize: 24, color: Color.fromRGBO(26, 173, 25, 1)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 1),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: ScreenAdaper.height(80),
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          height: ScreenAdaper.height(45),
                          width: ScreenAdaper.width(45),
                          child: Image.asset("images/User/wallet.png"),
                        ),
                        SizedBox(width: ScreenAdaper.width(10)),
                        Text(
                          "学分",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      this.userinfo.length > 0
                          ? this.userinfo[0].credits.toString() + "学分"
                          : "NaN" + "学分",
                      style: TextStyle(
                          fontSize: 24, color: Color.fromRGBO(26, 173, 25, 1)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 1),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: ScreenAdaper.height(80),
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          height: ScreenAdaper.height(45),
                          width: ScreenAdaper.width(45),
                          child: Image.asset("images/User/mission.png"),
                        ),
                        SizedBox(width: ScreenAdaper.width(10)),
                        Text(
                          "签到",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(179, 179, 179, 1),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 1),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: ScreenAdaper.height(80),
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          height: ScreenAdaper.height(45),
                          width: ScreenAdaper.width(45),
                          child: Image.asset("images/User/gift.png"),
                        ),
                        SizedBox(width: ScreenAdaper.width(10)),
                        Text(
                          "积分商城",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(179, 179, 179, 1),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 1),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: ScreenAdaper.height(80),
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          height: ScreenAdaper.height(45),
                          width: ScreenAdaper.width(45),
                          child: Image.asset("images/User/mission.png"),
                        ),
                        SizedBox(width: ScreenAdaper.width(10)),
                        Text(
                          "拍照模式",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(179, 179, 179, 1),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: ScreenAdaper.height(80),
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          height: ScreenAdaper.height(45),
                          width: ScreenAdaper.width(45),
                          child: Image.asset("images/User/docu.png"),
                        ),
                        SizedBox(width: ScreenAdaper.width(10)),
                        Text(
                          "版本号",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "V 4.0.0(2020092702)",
                          style:
                              TextStyle(color: Color.fromRGBO(71, 74, 74, 1)),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromRGBO(179, 179, 179, 1),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: ScreenAdaper.height(80),
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            height: ScreenAdaper.height(45),
                            width: ScreenAdaper.width(45),
                            child: Image.asset("images/User/power.png"),
                          ),
                          SizedBox(width: ScreenAdaper.width(10)),
                          Text(
                            "退出",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(179, 179, 179, 1),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                TokenStorage.cleanToken();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/login", (Route route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
