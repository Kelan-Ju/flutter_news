import 'package:flutter/material.dart';

Widget iconView(double left, String iconAsset, String count) {
  return Padding(
      padding: EdgeInsets.only(left: left),
      child: Row(
        children: <Widget>[
          ImageIcon(AssetImage(iconAsset), size: 18.0, color: Colors.grey[600]),
          Padding(
            padding: EdgeInsets.only(left: 2.0),
            child: Text(count,
                style: TextStyle(fontSize: 13.0, color: Colors.grey)),
          )
        ],
      ));
}