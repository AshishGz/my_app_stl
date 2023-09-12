import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:my_app_stl/modal/ToDo.dart';
import 'package:my_app_stl/screens/ManageTodo.dart';

class ToDoAppHome extends StatefulWidget {
  const ToDoAppHome({Key? key}) : super(key: key);

  @override
  State<ToDoAppHome> createState() => _ToDoAppHomeState();
}

class _ToDoAppHomeState extends State<ToDoAppHome> {
  List todo = <ToDo>[];

  @override
  void initState() {
    super.initState();
    onGetData();
  }

  onGetData() async {

    final box = await Hive.openBox<ToDo>('todo');

    todo = box.values.toList();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,


          child: Icon(Icons.add), onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
             ManageTodo()),
          ).then((value) => {
            onGetData()
          });
        },
        ),
        body: ListView(
          children: [
            ...todo.map((e) => Container(
                color: Color(e.color),
                child: Text(e.todo)))
          ],
        ));
  }
}
