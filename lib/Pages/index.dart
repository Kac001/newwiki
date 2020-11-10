import 'package:flutter/material.dart';
import 'package:newwiki/Pages/Community/Community.dart';
import 'package:newwiki/Pages/Mission/Mission.dart';
import 'package:newwiki/Pages/User/User.dart';
import '../Pages/Home/Home.dart';
import '../widget/index_appbar.dart';
import '../Services/screen_adaper.dart';

import 'package:common_utils/common_utils.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _bottomValue = 0;
  List<Widget> _pageList = [
    Homepage(),
    MissionPage(),
    CommunityPage(),
    CommunityPage(),
    UserPage(),
  ];
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    this._pageController = PageController(initialPage: _bottomValue);
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context);
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: this._pageController,
        children: this._pageList,
        onPageChanged: (value) {
          setState(() {
            this._bottomValue = value;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._bottomValue,
        type: BottomNavigationBarType.fixed, //底部导航栏的类型
        fixedColor: Color.fromRGBO(26, 173, 25, 1), //底部导航栏选中的颜色
        items: [
          BottomNavigationBarItem(
              //使用图片图标
              icon: ImageIcon(AssetImage("images/index/home.png")),
              activeIcon: ImageIcon(AssetImage("images/index/home-select.png")),
              label: "首页"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/index/mission.png")),
              activeIcon:
                  ImageIcon(AssetImage("images/index/mission-select.png")),
              label: "任务"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/index/talk.png")),
              activeIcon: ImageIcon(AssetImage("images/index/talk-select.png")),
              label: "社区"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("images/index/person.png")),
              activeIcon:
                  ImageIcon(AssetImage("images/index/person-select.png")),
              label: "我的"),
        ],
        onTap: (value) {
          setState(() {
            this._bottomValue = value;
            _pageController.jumpToPage(value);
          });
        },
      ),
      floatingActionButton: Container(
        height: ScreenAdaper.height(260),
        width: ScreenAdaper.width(178),
        // margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.only(top: 60),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.transparent),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Image.asset("images/index/tree.png"),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
