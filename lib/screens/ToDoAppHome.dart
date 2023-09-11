import 'package:flutter/material.dart';
import 'package:my_app_stl/screens/ManageTodo.dart';

class ToDoAppHome extends StatelessWidget {
  const ToDoAppHome({Key? key}) : super(key: key);

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
          );
        },
        ),
        body: Container());
  }
}
