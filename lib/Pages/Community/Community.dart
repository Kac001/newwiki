import 'package:flutter/material.dart';
import 'package:newwiki/Api/communityApi.dart';
import 'package:newwiki/Common/Widget/Toast.dart';
import 'package:newwiki/Services/ScreenAdaper.dart';
import 'package:newwiki/Services/Storage/tokenStorage.dart';
import '../../Model/community/activity.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({Key key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with AutomaticKeepAliveClientMixin {
  List<ListItem> activityList = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getActvity();
  }

  getActvity() async {
    var token = await TokenStorage.getToken();
    var resp = getActivityApi(token);
    resp.then((value) {
      // print(value.status);
      setState(() {
        activityList.addAll(value.data.list);
      });
      // print(activityList.length);
    });
  }

  Widget topicContent() {
    return ListView.builder(
        controller: _scrollController,
        itemCount: this.activityList.length,
        itemBuilder: (count, index) {
          return GestureDetector(
            child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                //外容器不设置高度  内容器会自适应
                // height: ScreenAdaper.height(430),
                width: ScreenAdaper.width(375),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(children: [
                      Text(this.activityList[index].activityTitle,
                          style: TextStyle(
                            fontSize: 20,
                          ))
                    ]),
                    Row(children: [
                      Container(
                        height: ScreenAdaper.height(40),
                        width: ScreenAdaper.width(40),
                        child: Image.asset("images/community/anima.png"),
                      ),
                      SizedBox(
                        width: ScreenAdaper.width(10),
                      ),
                      Text(this.activityList[index].activityIntroduction,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                          ))
                    ]),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      height: ScreenAdaper.height(300),
                      width: ScreenAdaper.width(700),
                      child: Image.network(
                        this.activityList[index].frontImgPath,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: ScreenAdaper.height(10),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            this.activityList[index].acStartTimeStr +
                                "-" +
                                this.activityList[index].acEndTimeStr,
                            style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            this.activityList[index].browseNum.toString() +
                                "浏览",
                            style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1)),
                          ),
                        )
                      ],
                    )
                  ],
                )),
            onTap: () {
              toastMsg(text: "正在开发中~");
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("社区"),
        elevation: 0,
        actions: [
          Container(
            height: ScreenAdaper.height(53.65),
            width: ScreenAdaper.width(53.65),
            margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
            child: Image.asset("images/mission/clock.png"),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: topicContent(),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
