import 'package:flutter/material.dart';
import 'package:newwiki/model/user/user_info.dart';
import 'package:newwiki/services/screen_adaper.dart';

class IndexAppbat extends StatefulWidget implements PreferredSizeWidget {
  List<User> userinfo;

  IndexAppbat({Key key, List<User> this.userinfo}) : super(key: key);

  @override
  _IndexAppbatState createState() => _IndexAppbatState();

  @override
  Size get preferredSize {
    return Size.fromHeight(56.0);
  }
}

class _IndexAppbatState extends State<IndexAppbat> {
  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);

    return Container(
        color: Colors.white,
        width: ScreenAdaper.width(375),
        margin: EdgeInsets.only(top: ScreenAdaper.height(40)),
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: ScreenAdaper.height(19),
                      right: ScreenAdaper.height(9)),
                  child: CircleAvatar(
                    backgroundImage: widget.userinfo.length > 0
                        ? widget.userinfo[0].userHeadImage != ""
                            ? NetworkImage(widget.userinfo[0].userHeadImage)
                            : AssetImage("images/person.jpg")
                        : AssetImage("images/person.jpg"),
                  ),
                ),
                Container(
                  height: ScreenAdaper.height(100),
                  padding: EdgeInsets.only(top: ScreenAdaper.height(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userinfo.length > 0
                            ? widget.userinfo[0].name
                            : "",
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(height: ScreenAdaper.height(5)),
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "images/coin.jpg",
                            ),
                          ),
                          SizedBox(
                            width: ScreenAdaper.width(4),
                          ),
                          Text(
                            widget.userinfo.length > 0
                                ? widget.userinfo[0].userCoin.toString()
                                : "",
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
            Positioned(
                right: 1,
                child: Row(
                  children: [
                    Container(
                      height: ScreenAdaper.height(53.65),
                      width: ScreenAdaper.width(53.65),
                      margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
                      child: Image.asset("images/magnifier.png"),
                    ),
                    Container(
                      height: ScreenAdaper.height(53.65),
                      width: ScreenAdaper.width(53.65),
                      margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
                      child: Image.asset("images/scan.png"),
                    ),
                    Container(
                      height: ScreenAdaper.height(53.65),
                      width: ScreenAdaper.width(53.65),
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Image.asset("images/talk.png"),
                    ),
                  ],
                ))
          ],
        ));
  }
}
