import 'package:flutter/material.dart';
import 'package:news_demo/webView.dart';
import 'models/newsModel.dart';
import 'tools.dart';

Widget newsContent(List<NewsFeed> datas, int index, BuildContext context) {
  return GestureDetector(
    onTap: () {
      itemTap(datas[index], context);
    },
    child: view(datas, index),
  );
}

Widget view(List<NewsFeed> datas, int index) {
  return Column(
    children: <Widget>[
      Image.network(datas[index].image),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${datas[index].post.title}', style: TextStyle(fontSize: 15.0)),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text('${datas[index].post.description}', style: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Text('${datas[index].post.category.title}', style: TextStyle(color: Colors.grey, fontSize: 13.0)),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: iconView(10.0, 'lib/resources/comment.png', '${datas[index].post.commentCount}', 14.0)
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: iconView(10.0, 'lib/resources/praise.png', '${datas[index].post.praiseCount}', 18.0)
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: iconView(10.0, 'lib/resources/date.png', '${convertTime(datas[index].post.publishTime)}', 14.0)
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}

Widget iconView(double left, String iconAsset, String count, double size) {
  return Padding(
      padding: EdgeInsets.only(left: left),
      child: Row(
        children: <Widget>[
          ImageIcon(AssetImage(iconAsset), size: size, color: Colors.grey[600]),
          Padding(
            padding: EdgeInsets.only(left: 2.5),
            child: Text(count,
                style: TextStyle(fontSize: 13.0, color: Colors.grey)),
          )
        ],
      ));
}

void itemTap(NewsFeed feed, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => WebView(url: '${feed.post.appview}')));
}
