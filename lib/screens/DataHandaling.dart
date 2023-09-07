import 'package:flutter/material.dart';
import 'package:my_app_stl/data.dart';
import 'package:my_app_stl/modal/News.dart';

class DataHandaling extends StatefulWidget {
  const DataHandaling({Key? key}) : super(key: key);

  @override
  State<DataHandaling> createState() => _DataHandalingState();
}

class _DataHandalingState extends State<DataHandaling> {
  List<News> news=[];
  onGetNewsData(){
    NewsData.forEach((e) =>
    news.add(News.fromJson(e))
    );
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    onGetNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    ListView.builder(
      scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          News n=news[index];
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Image.network(n.urlToImage)),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(n.title),
                        Text(n.description),
                        Text(n.publishedAt),
                      ],
                    ),
                  ),
                 
                ],
              ),

            ],
          );
        }
    ),

    );
  }
}
