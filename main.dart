import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:convert';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url;
  var Data;
  String Query='Query';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(10.0),
            child: TextField( 
            onChanged: (value){
              url="http://10.0.2.2:5000/predict?Query="+value.toString();

            },
            decoration: InputDecoration(
              hintText: "Put Spam Message Here...",
              suffixIcon: GestureDetector(
                onTap: ()async{
                   Data= await Get_Data(url);
                  var decoded_data=jsonDecode(Data);
                 setState(() {
                   Query=decoded_data['Query'];
                 });
                },
                child: Icon(
                  Icons.search
                )
              )
            ),

            ),
            ),
            Padding(padding:const EdgeInsets.fromLTRB(0, 20, 0, 0) ,
            child: Text(Query,style: TextStyle(color: Colors.red,fontSize: 30.0,fontWeight: FontWeight.bold),),)
           
          ],),
      ),
      
    );
  }
}
