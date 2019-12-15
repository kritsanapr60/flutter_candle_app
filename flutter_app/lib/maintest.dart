import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_app/map.dart';
import 'package:flutter_app/news.dart';
import 'package:flutter_app/suggest.dart';
import 'package:flutter_app/temple.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';




void main()=> runApp(new MyApp());




class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

@override
void initState() { 
  super.initState();
  readData();
}


readData() async {
print("Reading Data From DataBase");

    DatabaseReference databaseReference = firebaseDatabase.reference().child('templeM').child('-LFVHWUjmJwJmj03SMyq');
    await databaseReference.once().then((DataSnapshot dataSnapshop) {
      print('Data ==> ${dataSnapshop.value}');
//    var getdata = (dataSnapshop.value['ratingCount']);
//    print(getdata);
//    return getdata;
    });
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: appTitle,
      home: Scaffold(
      appBar: AppBar( backgroundColor: Colors.orangeAccent, // status bar color
      brightness: Brightness.light, title: Text("Candle")),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            
           UserAccountsDrawerHeader(
             accountName: Text("UBON RATCHATANI UNIVERSITY",
             style: TextStyle(color: Colors.black),),
             accountEmail: Text("ubon.candle@gmail.com",
             style: TextStyle(color: Colors.black),),
             decoration:   BoxDecoration(
                color: Colors.orangeAccent,
              ),

             currentAccountPicture: CircleAvatar(
               backgroundColor: Colors.black26,
               child: Text("IOS"), 
             ),
             ),
             
            ListTile(
              leading: Icon(Icons.chrome_reader_mode),
              title: Text('ข้อมูลเทียนเเต่ละวัด'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('แผนที่วัดทั้งหมด'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('ข่าวสารล่าสุด'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text('แนะนำ'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ),
    );
  }
}