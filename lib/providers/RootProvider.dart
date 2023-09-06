import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_stl/modal/AppData.dart';

class RootProvider with ChangeNotifier{
late AppData _appData=AppData('en',Colors.blue);

AppData get appData => _appData;

setAppData(AppData appData){
  _appData=appData;
  notifyListeners();

}

}