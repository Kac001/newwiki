import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newwiki/Api/Home/homeApi.dart';
import 'package:newwiki/Api/userApi.dart';
import 'package:newwiki/Common/Widget/Toast.dart';
import 'package:newwiki/Model/Home/HomeSwipe.dart';
import 'package:newwiki/Model/Home/PermissionsList.dart';
import 'package:newwiki/Model/Home/newsReport.dart';
import 'package:newwiki/Model/User/userInfo.dart';
import 'package:newwiki/Services/ScreenAdaper.dart';
import 'package:newwiki/Services/Storage/tokenStorage.dart';
import '../../Widget/IndexAppbar.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

//轮播图
Widget swiperWidget(swipeList) {
  return Container(
      margin: EdgeInsets.all(5),
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
            autoplay: true,
            itemCount: swipeList.length,
            itemBuilder: (BuildContext context, int index) {
              return CachedNetworkImage(
                imageUrl: swipeList[index].imgPath,
                fit: BoxFit.cover,
              );
            }),
      ));
}

//模块显示组件
Widget appModule(List<Permissions> permissionsList) {
  return Container(
    margin: EdgeInsets.fromLTRB(ScreenAdaper.width(15), ScreenAdaper.height(15),
        ScreenAdaper.width(15), 0),
    child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5.0,
        runSpacing: 0.0,
        children: permissionsList.map((value) {
          return GestureDetector(
              onTap: () {
                toastMsg(text: "正在开发中~", gravity: ToastGravity.CENTER);
              },
              child: Container(
                // margin: EdgeInsets.fromLTRB(ScreenAdaper.width(30),
                //     ScreenAdaper.height(10), ScreenAdaper.width(20), 0),
                height: ScreenAdaper.height(110),
                width: ScreenAdaper.width(135),
                child: Column(
                  children: [
                    Image.network(
                      value.imgPath,
                      fit: BoxFit.cover,
                      height: ScreenAdaper.height(70),
                      width: ScreenAdaper.width(70),
                    ),
                    Text(
                      value.name,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: "apple",
                      ),
                    )
                  ],
                ),
              ));
        }).toList()),
  );
}

//参林快报widget
//todo 差跳转没写
class newsReportWidget extends StatefulWidget {
  newsReportWidget({Key key}) : super(key: key);

  @override
  _newRepoetState createState() => _newRepoetState();
}

class _newRepoetState extends State<newsReportWidget>
    with WidgetsBindingObserver {
  GlobalKey _myKey = new GlobalKey();
  ScrollController _controller;
  int index = 0;
  List<newsReportResult> newsReportList = [];

  @override
  void initState() {
    super.initState();
    getNewsReport();
    //来监听 是否build完成
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    ////节点build完成的回调
    widgetsBinding.addPostFrameCallback((callback) {
      Timer.periodic(new Duration(seconds: 5), (timer) {
        //根据容器高度 判断出，当前item结尾，下一条item的开始位置,用于跳转到下一条item进行翻页
        index += _myKey.currentContext.size.height.toInt();
        // print((index - _myKey.currentContext.size.height.toInt()).toDouble());
        // print(_controller.position.maxScrollExtent);
        //跳转到当前item结尾，下一条item的开始位置,跳转速度为1秒 curve为跳转效果  Curves.easeOutSine滚蛋翻页
        _controller.animateTo(index.toDouble(),
            duration: new Duration(seconds: 1), curve: Curves.easeOutSine);
        //如果当前item结尾，下一条item到了listview的结尾
        if ((index - _myKey.currentContext.size.height.toInt()).toDouble() >
            _controller.position.maxScrollExtent - 3) {
          // print("stop");
          //返回到listview的开头
          _controller.jumpTo(_controller.position.minScrollExtent);
          index = 0;
        }
      });
    });

    _controller = new ScrollController(initialScrollOffset: 0);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  getNewsReport() async {
    var token = await TokenStorage.getToken();

    var resp = getnewsReportApi(token);
    resp.then((value) {
      setState(() {
        newsReportList.addAll(value.data.result);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdaper.height(50),
      width: ScreenAdaper.width(375),
      color: Color.fromRGBO(247, 244, 198, 1),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 10),
            height: ScreenAdaper.height(70),
            width: ScreenAdaper.width(120),
            child: Image.asset("images/index/newsreport.png"),
          ),
          Container(
            height: ScreenAdaper.height(50),
            width: ScreenAdaper.width(450),
            child: ListView.builder(
                key: _myKey,
                physics: NeverScrollableScrollPhysics(),
                itemCount: this.newsReportList.length,
                itemExtent: ScreenAdaper.height(50),
                scrollDirection: Axis.vertical,
                controller: _controller,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(bottom: ScreenAdaper.height(5)),
                    child: Text(
                      this.newsReportList[index].articleTitle,
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: ScreenAdaper.height(5), left: ScreenAdaper.width(40)),
            child: Text(
              "|",
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(128, 128, 128, 1)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: ScreenAdaper.height(5), left: ScreenAdaper.width(10)),
            child: Text(
              "更多",
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(128, 128, 128, 1)),
            ),
          )
        ],
      ),
    );
  }
}

//参林快报
Widget newsReport() {
  return Container(
    height: ScreenAdaper.height(50),
    width: ScreenAdaper.width(375),
    color: Color.fromRGBO(247, 244, 198, 1),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15, right: 10),
          height: ScreenAdaper.height(70),
          width: ScreenAdaper.width(120),
          child: Image.asset("images/index/newsreport.png"),
        ),
        Container(
          padding: EdgeInsets.only(bottom: ScreenAdaper.height(5)),
          child: Text(
            "百科首页-全部-应用-自定义应用配置指引",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              bottom: ScreenAdaper.height(5), left: ScreenAdaper.width(40)),
          child: Text(
            "|",
            style: TextStyle(
                fontSize: 14, color: Color.fromRGBO(128, 128, 128, 1)),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              bottom: ScreenAdaper.height(5), left: ScreenAdaper.width(10)),
          child: Text(
            "更多",
            style: TextStyle(
                fontSize: 14, color: Color.fromRGBO(128, 128, 128, 1)),
          ),
        )
      ],
    ),
  );
}

// //新闻列表Tabbar
class newsTabbar extends StatefulWidget {
  newsTabbar({Key key}) : super(key: key);

  @override
  _newsTabbarState createState() => _newsTabbarState();
}

class _newsTabbarState extends State<newsTabbar> {
  final _tabbarList = ['全部', '流行疾病', '销售技巧', '黄金单品', '陈列销售'];
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(
      length: _tabbarList.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            indicatorColor: Color.fromRGBO(0, 159, 60, 1),
            labelColor: Color.fromRGBO(0, 159, 60, 1),
            unselectedLabelColor: Color.fromRGBO(74, 74, 74, 1),
            isScrollable: true,
            controller: _controller,
            tabs: _tabbarList.map((e) {
              return Tab(text: e);
            }).toList()),
        Container(
            height: ScreenAdaper.height(500),
            width: double.infinity,
            child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 18, right: 18),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "关于自有品牌夏季品牌夏季品牌夏季品牌夏季品牌",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: ScreenAdaper.height(30),
                                      ),
                                      Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              "2020-10-14",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      155, 155, 155, 1)),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: ScreenAdaper.height(25),
                                              width: ScreenAdaper.width(100),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  color: Color.fromRGBO(
                                                      245, 166, 35, 1)),
                                              child: Text(
                                                "浏览 8500",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            Container(
                              height: ScreenAdaper.height(150),
                              width: ScreenAdaper.width(300),
                              child: Image.asset(
                                "images/index/swiper.jpg",
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(title: Text("这是第一个tab")),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(title: Text("这是第一个tab")),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(title: Text("这是第一个tab")),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      ListTile(title: Text("这是第一个tab")),
                    ],
                  )
                ]))
      ],
    );
  }
}

class _HomepageState extends State<Homepage>
    with AutomaticKeepAliveClientMixin {
  List<User> userinfo = [];
  List<HomeSwipeResult> swipeList = [];
  List<Permissions> _permissionsList = [];

  @override
  void initState() {
    super.initState();
    getSwiper();
    getUserInfo();
    getPermissionsList();
  }

  getUserInfo() async {
    var token = await TokenStorage.getToken();
    var resp = getUserInfoApi(token);
    resp.then((value) {
      setState(() {
        userinfo.add(value.data.user);
      });
    });
  }

  getSwiper() async {
    var token = await TokenStorage.getToken();
    var resp = getHomeSwiperApi(token);
    resp.then((value) {
      setState(() {
        swipeList.addAll(value.data.result);
      });
    });
  }

  getPermissionsList() async {
    var token = await TokenStorage.getToken();
    var resp = getpermissionsListApi(token);
    resp.then((value) {
      setState(() {
        _permissionsList.addAll(value.data.permissions);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IndexAppbat(
        userinfo: userinfo,
      ),
      body: ListView(
        children: [
          swiperWidget(swipeList),
          appModule(_permissionsList),
          SizedBox(
            height: ScreenAdaper.height(20),
          ),
          // newsReport(),
          newsReportWidget(),
          newsTabbar()
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
