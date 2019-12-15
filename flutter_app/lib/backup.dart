import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'เเห่เทียนพรรษาอุบลราชธานี';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.orangeAccent, // status bar color
      brightness: Brightness.light, title: Text(title)),
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
    );
  }
}