import 'package:flutter/material.dart';

class ManageTodo extends StatefulWidget {
  const ManageTodo({Key? key}) : super(key: key);

  @override
  State<ManageTodo> createState() => _ManageTodoState();
}

class _ManageTodoState extends State<ManageTodo> {
  int selectedColor=0xffffffff;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(selectedColor),
        body: SafeArea(child: Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      child: ListView(
        children: [
          Text('Select Color',style: TextStyle(fontSize: 22,color: Colors.grey.shade700,fontWeight: FontWeight.w900),),
          SizedBox(height: 12,),
          Wrap(

            children: [
              ...[0xfff44336,0xffe91e63,0xff9c27b0,0xff2196f3,0xff009688,0xffff9800,0xffffeb3b,0xffdd2c00].map((e) =>
                  InkWell(
                    onTap: (){
                      selectedColor=e;
                      setState(() {

                      });
                    },
                    child: Container(
                margin: EdgeInsets.only(right: 12,bottom: 12),
                decoration: BoxDecoration(
                      color: Color(e),
                  border: Border.all(color: Colors.white),
                  shape: BoxShape.circle
                ),
                height: 60,
                width: 60,
                      child: selectedColor==e?Icon(Icons.done,color: Colors.white,):SizedBox.shrink(),
              ),
                  )),
            ],
          ),
          Text('Enter Your Text',style: TextStyle(fontSize: 22,color: Colors.grey.shade700,fontWeight: FontWeight.w900),),
          SizedBox(height: 12,),

          TextField(
            maxLines: 10,
        decoration: new InputDecoration(
          fillColor: Colors.grey,
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal)
          ),

          ),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child: Text('Save'))
        ],
      ),
    )));
  }
}
