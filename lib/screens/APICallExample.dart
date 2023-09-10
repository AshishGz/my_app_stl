import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:my_app_stl/modal/News.dart';

class APICallExample extends StatefulWidget {
  const APICallExample({Key? key}) : super(key: key);

  @override
  _APICallExampleState createState() => _APICallExampleState();
}

class _APICallExampleState extends State<APICallExample> {
  List<News> news=[];
  @override
  void initState() {
    super.initState();
    onGetData();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(
      children: [
        ...news.map((e) => Text(e.title))
      ],
    ));
  }
}
