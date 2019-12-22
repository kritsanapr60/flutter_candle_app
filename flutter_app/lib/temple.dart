import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/list_temple.dart';
import 'Posts.dart';
import 'news.dart';
import 'list_temple.dart';

class TemplePage extends StatefulWidget {
  @override
  _TemplePageState createState() => _TemplePageState();
}

class _TemplePageState extends State<TemplePage> {
  List<Temples> postsList = [];

  void initState() {
    super.initState();

    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("templeM");
    postsRef.once().then((DataSnapshot snap) {
      var DATA = snap.value;
      var KEYS = snap.value.keys;
      var list_image = [];
      var list_video =[];

      list_image.clear();
      postsList.clear();
      list_video.clear();

      for (var key in KEYS) {
        var KEYIMG = DATA[key]['images'].keys;
        var KEYVIDEO = DATA[key]['videos'].keys;
        
        var data_img = [];

        for (var im in KEYIMG){
          data_img.add( DATA[key]['images'][im] );
        }
        list_image.add(data_img);
        data_img.remove(true);
        // video
        var data_video =[];
        for (var vi in KEYVIDEO){
          data_video.add( DATA[key]['videos'][vi] );
        }
        list_video.add(data_video);
        data_video.remove(true);

        Temples temples = new Temples(
          DATA[key]['address']['en'],
          DATA[key]['address']['th'],
          DATA[key]['avatar'],
          DATA[key]['formalNames']['en'],
          DATA[key]['formalNames']['th'],
          DATA[key]['histories']['en'],
          DATA[key]['histories']['th'],
          DATA[key]['temple'],
          DATA[key]['website'],
          DATA[key]['lat'],
          DATA[key]['lng'],
          list_image,
          list_video,
        );
        postsList.add(temples);
      }
      setState(() {
        //print('-----------------------------------');
        print('Length : $postsList');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("ข้อมูลเทียนเเต่ละวัด"),
        ),
        body: Container(
          child: postsList.length == 0
              ? Center(child: Text("Please Connect Internet !!"))
              : ListView.builder(
                  itemCount: postsList.length,
                  itemBuilder: (_, index) {
                    return TempleUI(
                      postsList[index].address_en,
                      postsList[index].address_th,
                      postsList[index].avatar,
                      postsList[index].formalNames_en,
                      postsList[index].formalNames_th,
                      postsList[index].histories_en,
                      postsList[index].histories_th,
                      postsList[index].temple,
                      postsList[index].website,
                      postsList[index].lat,
                      postsList[index].lng,
                      postsList[index].images[index],
                      postsList[index].videos[index],

                    );
                  },
                ),
        ));
  }

  Widget TempleUI(
    String address_en,
    String address_th,
    String avatar,
    String formalNames_en,
    String formalNames_th,
    String histories_en,
    String histories_th,
    String temple,
    String website,
    double lat,
    double lng,
    List images,
    List videos,
  ) {
    //แก้ UI
    return GestureDetector(
        onTap: () {
          var route = MaterialPageRoute(
            builder: (BuildContext context) => List_TemplePage(
              avatar: avatar,
              address_en: address_en,
              address_th: address_th,
              formalNames_en: formalNames_en,
              formalNames_th: formalNames_th,
              histories_en: histories_en,
              histories_th: histories_th,
              website: website,
              lat: lat,
              lng: lng,
              images:images,
              videos:videos,
            ),
          );
          Navigator.of(context).push(route);
        },
        child: Container(
          child: Card(
            elevation: 10,
            margin: EdgeInsets.all(15),
            child: Container(
              padding: EdgeInsets.all(14),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(temple), //เรียกใช้
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network(avatar, fit: BoxFit.cover), //เรียกใช้
                ],
              ),
            ),
          ),
        ));
  }
}
