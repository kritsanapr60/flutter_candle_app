import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_html/flutter_html.dart';

import 'map.dart';
import 'news.dart';
import 'temple.dart';
import 'suggest.dart';

import 'Posts.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Posts> postsList = [];

  void initState() {
    super.initState();

    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("announcement");

    postsRef.once().then((DataSnapshot snap) {
      var DATA = snap.value;
      var KEYS = snap.value.keys;

      postsList.clear();

      for (var individualKey in KEYS) {
        Posts posts = new Posts(
          DATA[individualKey]['dateDetail'],
          DATA[individualKey]['dateStart'],
          DATA[individualKey]['description'],
          DATA[individualKey]['title'],
        );

        postsList.add(posts);
      }
      setState(() {
        print('oooooooooooooooooo');
        print('Length : $postsList.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("เเห่เทียนอุบลราชธานี"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
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
              accountName: Text(
                "UBON RATCHATANI UNIVERSITY",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                "ubon.candle@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              currentAccountPicture: CircleAvatar(
                   backgroundImage: new NetworkImage(
                       'https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.15752-9/78264477_501591130461955_409392661997289472_n.png?_nc_cat=100&_nc_eui2=AeGoF3fIXfRK5Su2Sn_ovjj_jNlVlI2ifg-KNZJLPhtnZ9vXNAMfdHA1rl28otrZz1uzRa8Hkx0bQoTiaXjtO76jvogG3hmV4X80u_nihOCLVQ&_nc_ohc=sgeZWOE4A0YAQmS0qsoZ9ONwmRjBTWGAPTjJPPR-8Mh5rM6FpH0RrzNNw&_nc_ht=scontent.fbkk5-5.fna&oh=dd891a2e7dc1fd72946469faf5ce1715&oe=5E86D5EC'),
                 ),
            ),
            ListTile(
              leading: Icon(Icons.chrome_reader_mode),
              title: Text('ข้อมูลเทียนเเต่ละวัด'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TemplePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('แผนที่วัดทั้งหมด'),
              onTap: () {
               Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MapPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('ข่าวสารล่าสุด'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NewsPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text('แนะนำ'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SuggestPage()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.close,
                color: Colors.red,
              ),
              title: Text(
                'Close',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: postsList.length == 0
            ? Text("Noblog")
            : ListView.builder(
                itemCount: postsList.length,
                itemBuilder: (_, index) {
                  return PostsUI(
                      postsList[index].dateDetail,
                      postsList[index].dateStart,
                      postsList[index].description,
                      postsList[index].title);
                },
              ),
      ),
    );
  }

  Widget PostsUI(
      String dateDetail, String dateStart, String description, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,3,3,1),
      child: Column(
        children: <Widget>[
          //เรียกใช้
          Html(data: dateDetail),
          Html(data: dateStart),
          Html(data: description),
          Html(data: title),
        ],
      ),
    );
  }
}
