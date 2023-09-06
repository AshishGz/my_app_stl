import 'package:flutter/material.dart';
import 'package:my_app_stl/providers/RootProvider.dart';
import 'package:my_app_stl/screens/FormPractice.dart';
import 'package:my_app_stl/screens/MyFristPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int currentPageIndex=0;
  @override
  Widget build(BuildContext context) {
    final mainProvider=Provider.of<RootProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("My First Flutter App"),),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.school),
              icon: Icon(Icons.school_outlined),
              label: 'School',
            ),
          ],
        ),
        body:
        <Widget>[
          MyFirstPage(),
          FormPractice(),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child:  Text(
                mainProvider.appData.local=='en'?'Page 3':'पृष्ठ ३'),
          ),
        ][currentPageIndex],
    );
  }
}
