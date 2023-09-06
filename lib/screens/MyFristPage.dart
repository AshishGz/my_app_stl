import 'package:flutter/material.dart';
import 'package:my_app_stl/modal/AppData.dart';
import 'package:my_app_stl/providers/RootProvider.dart';
import 'package:provider/provider.dart';

class MyFirstPage extends StatelessWidget {
  const MyFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final main=Provider.of<RootProvider>(context);
    return  ListView(
      children: [
        ElevatedButton(onPressed: (){
          AppData data=AppData(main.appData.local=='en'?'ne':'en',Colors.orange);
          main.setAppData(data);

        }, child: Text('Click Me')),
        Card(
          child: ListTile(
            leading: FlutterLogo(),
            title: Text('Ashish'),
            subtitle: Text('Buddhanagar-10'),
            trailing: Icon(Icons.favorite,color: Colors.red,),
          ),
        ),


      ],
    );
  }
}
