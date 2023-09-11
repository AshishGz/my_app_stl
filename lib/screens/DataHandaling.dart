import 'package:flutter/material.dart';
import 'package:my_app_stl/data.dart';
import 'package:my_app_stl/modal/News.dart';
import 'package:my_app_stl/screens/DataHandalingDetail.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class DataHandaling extends StatefulWidget {
  const DataHandaling({Key? key}) : super(key: key);

  @override
  State<DataHandaling> createState() => _DataHandalingState();
}

class _DataHandalingState extends State<DataHandaling> {
  List<News> news=[];
  onGetData() async {
    var url =
    Uri.https('www.jsonkeeper.com', '/b/KSFZ', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse=convert.jsonDecode(response.body);
      jsonResponse['articles'].forEach((e) =>
          news.add(News.fromJson(e))
      );
      print('Number of books about http:');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    setState(() {

    });
  }
  @override
  void initState() {
    super.initState();
    onGetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Articles",style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,elevation: 0,),
      body:
    ListView.builder(
      scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          News n=news[index];
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                 DataHandalingDetail(n: n)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.network(n.urlToImage)),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Column(
                                children: [
                                  Text(n.title,style: TextStyle(fontWeight: FontWeight.w900,
                                  fontSize: 16
                                  ),),
                                  Text(n.description,
                                    style:TextStyle(fontWeight: FontWeight.w500,
                                        fontSize: 14,color: Colors.grey.shade600
                                    )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: Text(n.author)),
                                      Expanded(child: Text(n.publishedAt)),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        }
    ),

    );
  }
}
