import 'package:flutter/material.dart';
import 'package:newwiki/Services/ScreenAdaper.dart';

class MissionPage extends StatefulWidget {
  MissionPage({Key key}) : super(key: key);

  @override
  _MissionPageState createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  TabController _controller;

  final _tabbarList = ['全部', '学习任务', '考试任务', '任务提醒'];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabbarList.length,
      vsync: ScrollableState(),
    );
  }

  Widget missionNotContext() {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: ScreenAdaper.height(300),
            width: ScreenAdaper.width(300),
            child: Image.asset("images/mission/nothing.jpg"),
          ),
          Text(
            "暂无数据",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: ScreenAdaper.height(10),
          ),
          Text(
            "当前列表暂无数据,请浏览其他内容",
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("任务"),
        elevation: 0,
        bottom: TabBar(
          tabs: _tabbarList.map((e) {
            return Tab(text: e);
          }).toList(),
          indicatorColor: Color.fromRGBO(0, 159, 60, 1),
          labelColor: Color.fromRGBO(0, 159, 60, 1),
          unselectedLabelColor: Color.fromRGBO(74, 74, 74, 1),
          controller: _controller,
        ),
        actions: [
          Container(
            height: ScreenAdaper.height(53.65),
            width: ScreenAdaper.width(53.65),
            margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
            child: Image.asset("images/mission/clock.png"),
          ),
        ],
      ),
      body: TabBarView(controller: _controller, children: [
        missionNotContext(),
        missionNotContext(),
        missionNotContext(),
        missionNotContext(),
      ]),
    );
  }
}
