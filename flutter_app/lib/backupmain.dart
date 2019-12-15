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
import 'list_temple.dart';


void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: HomePage(),
  //     routes: <String, WidgetBuilder>{}
  //       "/a": (BuildContext context) => Temple_Page("New Page"),
  // } 
  );
  }

}



class HomePage extends StatelessWidget {
FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

//   @override
//   void initState() {
//     super.initState();
//     readData();
//   }

  readData() {
    DatabaseReference databaseReference = firebaseDatabase.reference().child('templeM').child('-LFVHWUjmJwJmj03SMyq');
    databaseReference.once().then((DataSnapshot dataSnapshop) {
//    var getdata = (dataSnapshop.value['ratingCount']);
//    print(getdata);
//    return getdata;
    });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("แห่เทียนอุบลราชธานี"),
        elevation: defaultTargetPlatform == TargetPlatform.android?5.0 : 0.0,
      ),
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
                color: Colors.amber,
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
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                    TemplePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('แผนที่วัดทั้งหมด'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                    MapPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('ข่าวสารล่าสุด'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                    NewsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text('แนะนำ'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                    SuggestPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.close,color: Colors.red),
              title: Text('Close',style: TextStyle(color: Colors.red),),
              onTap: () {
                Navigator.pop(context);

              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                // new Icon(Icons.assistant_photo),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('กำหนดการงานแห่เทียนประจำปี 2562'),
                    Text(readData().toString()),
                  ],
                )
              )
            ],
          ),
          ),
      ),
    );




  }
}



