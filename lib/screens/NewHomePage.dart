import 'package:flutter/material.dart';
import 'package:my_app_stl/modal/AppData.dart';
import 'package:my_app_stl/providers/RootProvider.dart';
import 'package:my_app_stl/screens/HomePage.dart';
import 'package:provider/provider.dart';

class NewHomePage extends StatelessWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final main=Provider.of<RootProvider>(context);
    List<MaterialColor> colors=[Colors.red,
      Colors.green,
      Colors.orange,
      Colors.pink,Colors.purple];
    return Scaffold(
        appBar: AppBar(title: Text("New Home Page"),
        actions: [
          InkWell(
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: ListView(
                          children: <Widget>[
                            Text('Select Theme',style: TextStyle(
                                fontSize: 32,fontWeight: FontWeight.w900,
                                color: Colors.black
                            ),),
                           Padding(
                             padding: const EdgeInsets.symmetric(vertical: 10),
                             child: Divider(),
                           ),
                           ...colors.map((e) =>InkWell(
                             onTap:(){
                               AppData appData=AppData('en', e);
                               main.setAppData(appData);
                               Navigator.pop(context);
                    },
                               child: Container(
                               padding: EdgeInsets.all(12),
                               margin: EdgeInsets.all(8),

                               width: MediaQuery.of(context).size.width,
                               height:80,
                               decoration: BoxDecoration(
                                   color: e,
                                   borderRadius: BorderRadius.circular(10)
                               ),
                           ),
                             ) )

                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Icon(Icons.color_lens))
        ],
        ),
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
