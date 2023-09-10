import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_stl/modal/News.dart';

class DataHandalingDetail extends StatelessWidget {
  News news=new News(source: new Source(id: "", name: ""),
      author: "", title: "", description: "", url:"" ,
      urlToImage: "", publishedAt: "", content: "");

  DataHandalingDetail({required News n}){
   news=n;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Container(
        child: Text(news.title),
      ),
    ));
  }
}
