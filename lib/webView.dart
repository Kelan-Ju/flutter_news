import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  String url;
  WebView({Key key, @required this.url}) : super(key: key);
  @override
  WebViewState createState() => WebViewState();
}

class WebViewState extends State<WebView> {
  String url = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(appBar: AppBar(title: Text('新闻详情')), url: url);
  }
}
