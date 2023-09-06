import 'package:flutter/material.dart';
import 'package:my_app_stl/providers/RootProvider.dart';
import 'package:my_app_stl/screens/HomePage.dart';
import 'package:my_app_stl/screens/NewHomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RootProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final main=Provider.of<RootProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: main.appData.color,
      ),
      home: const NewHomePage(),
    );
  }
}


