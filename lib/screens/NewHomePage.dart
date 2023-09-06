import 'package:flutter/material.dart';
import 'package:my_app_stl/screens/HomePage.dart';

class NewHomePage extends StatelessWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("New Home Page"),),
        body: ListView(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                  const HomePage()),
                );
              },
              child: Container(
                child: Text("Go to Home Page"),
              ),
            ),
          ],
        ));
  }
}
