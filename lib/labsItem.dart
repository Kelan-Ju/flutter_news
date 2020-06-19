import 'package:flutter/material.dart';
import 'models/labsModel.dart';
import 'tools.dart';
import 'components.dart';
import 'webView.dart';

Widget labsContent(List<LabsFeed> datas, int index, BuildContext context) {
  return GestureDetector(
    child: view(datas, index),
    onTap: () {
      itemTap(datas[index], context);
    }
  );
}

Widget view(List<LabsFeed> datas, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      // 头部
      Padding(
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Row(children: [
          Expanded(
            child: Row(children: [
              ClipOval(
                child: Image.network(
                  datas[index].post.column.icon,
                  width: 40.0,
                  height: 40.0,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(datas[index].post.column.name,
                            style: TextStyle(fontSize: 15, height: 1.5),
                            textAlign: TextAlign.start),
                        Text('${convertTime(datas[index].post.publishTime)}',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey, height: 1.5),
                            textAlign: TextAlign.start)
                      ]))
            ]),
          ),
          IconButton(icon: Icon(Icons.share), onPressed: null)
        ]),
      ),

      Image.network(datas[index].image),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(datas[index].post.title, style: TextStyle(fontSize: 15.0)),
          Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(datas[index].post.description,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey)))
        ]),
      ),
      Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: Row(children: [
          iconView(0, 'lib/resources/praise.png',
              '${datas[index].post.praiseCount}'),
          iconView(
              40, 'lib/resources/view.png', '${datas[index].post.recordCount}'),
        ]),
      )
    ],
  );
}

void itemTap(LabsFeed feed, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => WebView(url: 'http://www.qdaily.com/papers/${feed.post.id}.html')));
}
