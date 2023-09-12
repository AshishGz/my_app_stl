import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app_stl/modal/ToDo.dart';
import 'package:my_app_stl/providers/RootProvider.dart';
import 'package:my_app_stl/screens/DataHandaling.dart';
import 'package:my_app_stl/screens/HomePage.dart';
import 'package:my_app_stl/screens/NewHomePage.dart';
import 'package:my_app_stl/screens/ToDoAppHome.dart';
import 'package:provider/provider.dart';

import 'screens/APICallExample.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoAdapter());
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RootProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    final main=Provider.of<RootProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: main.appData.color,
      ),
      home: const ToDoAppHome(),
    );
  }
}


