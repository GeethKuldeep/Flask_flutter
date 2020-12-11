import 'package:flutter/material.dart';
import 'API.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url;
  var Data;
  String QueryText='No Ingredients passed';
  var color1 = const Color(0xffFBD00D);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(

          title: Text('Basic Implementation'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                onChanged: (value){
                  url ='http://127.0.0.1:5000/api?Ingredients='+value.toString();
                },
                style: TextStyle(color: color1),
                cursorColor: Colors.white,
                key: ValueKey("Ingredients"),
                decoration: InputDecoration(
                  errorBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white,
                      width: 2.0,),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  labelStyle: TextStyle(color: Colors.white,fontSize: 13),
                  contentPadding: const EdgeInsets.all(8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  labelText: 'Enter the Ingredients',
                  errorStyle: TextStyle(
                    color: color1,
                  ),
                  suffixIcon:GestureDetector(onTap:()async{
                        Data= await Getdata(url);
                        var DecodedData =jsonDecode(Data);
                        setState((){
                          QueryText= DecodedData['Ingredients'];
                        });
                    },
                    child:Icon(Icons.search),

                  ),
                ),

              ),

            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.all(25),
              child: Text(QueryText,style: TextStyle(color: Colors.white),),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );

  }
}

