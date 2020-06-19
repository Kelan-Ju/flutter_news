import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_demo/newsItem.dart';
import 'models/labsModel.dart';
import 'models/newsModel.dart';
import 'labsItem.dart';
//http://app3.qdaily.com/app3/papers/index/0.json

final List<String> tabs = ['Labs', 'News'];

Widget newsTab = DefaultTabController(
    length: tabs.length,
    child: Scaffold(
      appBar: AppBar(
        title: Text('NEWS'),
        bottom: TabBar(
            labelStyle: TextStyle(fontSize: 18.0),
            tabs: tabs.map((String title) {
              return Tab(
                text: title,
              );
            }).toList()),
      ),
      body: TabBarView(children: [
        NewsTabView(url: 'http://app3.qdaily.com/app3/papers/index/0.json'),
        NewsTabView(url: 'http://app3.qdaily.com/app3/homes/index_v2/0.json')
      ]),
    ));

class NewsTabView extends StatefulWidget {
  final url;
  NewsTabView({Key key, this.url}) : super(key: key);
  @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
  NewsState createState() => NewsState();
}

class NewsState extends State<NewsTabView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String url;
  List<LabsFeed> labsArray = [];
  List<NewsFeed> newsArray = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = widget.url;
    getDate();
  }

  bool isNewsPage() {
    return url.contains('homes/index_v2') ? true : false;
  }

  void getDate() async {
    Response response = await Dio().get(url);
    if (isNewsPage()) {
      NewsModel model = NewsModel.fromJson(response.data);
      setState(() {
        newsArray = model.response.feeds;
      });
    } else {
      LabsModel model = LabsModel.fromJson(response.data);
      setState(() {
        labsArray = model.response.feeds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return RefreshIndicator(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              if (isNewsPage()) {
                return newsContent(newsArray, index, context);
              } else {
                return labsContent(labsArray, index, context);
              }
            },
            separatorBuilder: (BuildContext context, int index) {
              // return Divider(color: Colors.grey, height: 1.0);
              return Container(
                height: 5.0,
                color: Colors.grey[200],
              );
            },
            itemCount: isNewsPage() ? newsArray.length : labsArray.length
          ),
        onRefresh: (() => pageRefresh()));
  }

  Future<void> pageRefresh() async {
    if (isNewsPage()) {
      newsArray.clear();
    } else {
      labsArray.clear();
    }
    await Future.delayed(Duration(seconds: 1), (){
      getDate();
    });
  }
}
