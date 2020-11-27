import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:newwiki/services/screen_adaper.dart';

class CommunityDetailPage extends StatefulWidget {
  CommunityDetailPage({Key key}) : super(key: key);

  @override
  _CommunityDetailState createState() => _CommunityDetailState();
}

class _CommunityDetailState extends State<CommunityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, elevation: 0, actions: [
        Container(
          alignment: Alignment.center,
          height: ScreenAdaper.height(53.65),
          //内容有增长的 不设置宽度
          // width: ScreenAdaper.width(150),
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          margin: EdgeInsets.fromLTRB(10, 10, 15, 10),

          decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(231, 74, 43, 1), width: 2),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            "2跟帖",
            style: TextStyle(
                color: Color.fromRGBO(231, 74, 43, 1),
                fontSize: ScreenAdaper.size(30)),
          ),
        ),
        Container(
          height: ScreenAdaper.height(53.65),
          width: ScreenAdaper.width(53.65),
          margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
          child: Image.asset("images/community/more.png"),
        )
      ]),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: ScreenAdaper.height(100),
              width: double.infinity,
              child: Text("data"),
            ),
          ),
          Container(
            color: Color.fromRGBO(245, 245, 245, 1),
            child: InAppWebView(
                onScrollChanged:
                    (InAppWebViewController controller, int x, int y) {
                  print(y);
                },
                // initialUrl: "http://jd.itying.com/pcontent?id=",
                initialData: InAppWebViewInitialData(
                    data:
                        "<p><img src=\"https://dsl-ds.dslbuy.com/66666A3A285E47D49BB31FFF4C8E8D23.jpg\" _src=\"https://dsl-ds.dslbuy.com/66666A3A285E47D49BB31FFF4C8E8D23.jpg\"/><img src=\"https://dsl-ds.dslbuy.com/33D68666561F4BC1AF7E901FC08C9EBC.JPG\" _src=\"https://dsl-ds.dslbuy.com/33D68666561F4BC1AF7E901FC08C9EBC.JPG\"/><img src=\"https://dsl-ds.dslbuy.com/787A9B9DA0604F11821A783E1F904C74.JPG\" _src=\"https://dsl-ds.dslbuy.com/787A9B9DA0604F11821A783E1F904C74.JPG\"/><img src=\"https://dsl-ds.dslbuy.com/9E6076AF6F384B3B86BE8D060750A189.JPG\" _src=\"https://dsl-ds.dslbuy.com/9E6076AF6F384B3B86BE8D060750A189.JPG\"/><img src=\"https://dsl-ds.dslbuy.com/65EE9AEB2BFE4943B6618328764F06FE.JPG\" _src=\"https://dsl-ds.dslbuy.com/65EE9AEB2BFE4943B6618328764F06FE.JPG\"/></p><p><img src=\"https://dsl-ds.dslbuy.com/384E86907117414F9E682FD2F5B46042.jpg\" _src=\"https://dsl-ds.dslbuy.com/384E86907117414F9E682FD2F5B46042.jpg\"/></p><p><img src=\"https://dsl-ds.dslbuy.com/8E0A1685CA0A43EB99136F0E23949BE5.JPG\" _src=\"https://dsl-ds.dslbuy.com/8E0A1685CA0A43EB99136F0E23949BE5.JPG\"/></p>"),
                //webview初始化监听
                onProgressChanged: (controller, progress) {
                  //显示加载进度
                  print(progress / 100);
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenAdaper.height(100),
              width: double.infinity,
              color: Color.fromRGBO(245, 245, 245, 1),
              child: Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        child: Text("我要评论"),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
