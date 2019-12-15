import 'package:flutter/material.dart';
import 'package:flutter_app/list_map.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
class List_TemplePage extends StatefulWidget {
  String avatar;
  String address_en;
  String address_th;
  String formalNames_th;
  String formalNames_en;
  String histories_en;
  String histories_th;
  String website;

  List_TemplePage({
    Key key,
    this.avatar,
    this.address_en,
    this.address_th,
    this.formalNames_th,
    this.formalNames_en,
    this.histories_en,
    this.histories_th,
    this.website,
  }) : super(key: key);

  @override
  _TempPageState createState() => _TempPageState();
}

class _TempPageState extends State<List_TemplePage> {
  @override
  Widget build(BuildContext context) {
    return List_fo_lsitTample();
  }

  Widget List_fo_lsitTample() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.formalNames_th),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(widget.avatar),
                      Divider(),
                      Html(data:"<b>ชื่อไทย : </b>" + widget.formalNames_th),
                      Html(data:"<b>ชื่ออังกฤษ : </b>" + widget.formalNames_en),
                      Html(data:"<b>ที่อยู่ : </b>" +
                          widget.address_th +
                          "(" +
                          widget.address_en +
                          ")"),
                      Html(data:"<b>ประวัติ : </b>" + widget.address_th),
                      Html(data:"<b>History : </b>" + widget.address_en),
                      Divider(),
                      InkWell(
                        child: Html(data:"<b>เว็บไซต์ : </b>" + widget.website),
                        onTap: () async {
                          if (await canLaunch(widget.website)) {
                            await launch(widget.website);
                          }
                        },
                      ),
                      // Text(
                      // "name_th => ${widget.formalNames_th}\nname_en => ${widget.formalNames_en}\naddress_th => ${widget.address_th}\naddress_en =>${widget.address_en}\navatar => ${widget.avatar}\nhis_en => ${widget.histories_en}\nhis_th => ${widget.histories_th}\nwebsite => ${widget.website}"),
                    ],
                  )
                ],
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => _showDetailPage(context),
        onPressed: () {
          var route = MaterialPageRoute(
            builder: (BuildContext context) => List_MapPage(),
          );
          Navigator.of(context).push(route);
        },
        child: Icon(Icons.map),
        backgroundColor: Colors.amber,
      ),
    );
  }
}

// import 'package:flutter_app/backupmain.dart';

// import 'Posts.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:fab_circular_menu/fab_circular_menu.dart';
// import 'home.dart';
// import 'map.dart';
// import 'news.dart';
// import 'temple.dart';
// import 'suggest.dart';

// import 'Posts.dart';

// class List_TemplePage extends StatefulWidget {
//     String avatar;
//   String address_en;
//   String address_th;
//   String formalNames_th;
//   String formalNames_en;
//   String histories_en;
//   String histories_th;
//   String website;

//   List_TemplePage({Key key,
//     this.avatar,
//     this.address_en,
//     this.address_th,
//     this.formalNames_th,
//     this.formalNames_en,
//     this.histories_en,
//     this.histories_th,
//     this.website,
//     }) : super (key: key);

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _MyAppState();
//   }

// }

// class _MyAppState extends State<List_TemplePage> {
//   @override
//   State<StatefulWidget> createState() {
//     List<Temples> postsList = [];

//     @override
//     void initState() {
//       super.initState();

//       DatabaseReference postsRef =
//           FirebaseDatabase.instance.reference().child('templeM');
//       postsRef.once().then((DataSnapshot snap) {
//         var KEYS = snap.value.keys;
//         var DATA = snap.value;
//         postsList.clear();

//         for (var key in KEYS) {
//           Temples temples = new Temples(
//             DATA[key]['avatar'],
//             DATA[key]['temple'],
//           );
//           postsList.add(temples);
//         }

//         setState(() {
//           print('Length: $postsList.length');
//         });
//       });
//     }

//     return _MyAppState();
//   }

//   void posts() => Posts;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: Text("วัด....."),
//       ),
//       body: FabCircularMenu(
//         fabColor: Colors.amber,
//         child: Container(
//           color: Colors.white,
//           child: Center(
//               child: Padding(
//             padding: const EdgeInsets.only(bottom: 256.0),
//             child: Text('Wait Data',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.black, fontSize: 20.0)),
//           )),
//         ),
//         ringColor: Colors.amberAccent[100],
//         options: <Widget>[
//           IconButton(
//               icon: Icon(Icons.home),
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (BuildContext context) => MyHomePage()));
//               },
//               iconSize: 48.0,
//               color: Colors.amber),
//           IconButton(
//               icon: Icon(Icons.map),
//               onPressed: () {},
//               iconSize: 48.0,
//               color: Colors.amber),
//         ],
//       ),
//     );
//   }

//   Widget PostUI(String avatar, String lat, String lng, String map,
//       String rating, String ratingCount, String tample) {
//     return new Card(
//       elevation: 10.0,
//       margin: EdgeInsets.all(15.0),
//       child: new Container(
//         padding: new EdgeInsets.all(14.0),
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             new Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 new Text(map),
//               ],
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             new Image.network(avatar, fit: BoxFit.cover),
//             SizedBox(
//               height: 10.0,
//             ),
//             new Text(lat),
//           ],
//         ),
//       ),
//     );
//   }
// }
