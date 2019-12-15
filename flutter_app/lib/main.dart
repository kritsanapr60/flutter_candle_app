import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home.dart';

void main() => runApp(MaterialApp(
    title: 'Flutter Test',
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));




class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text('\nแห่เทียนอุบลราชธานี',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: Image.asset('asset/icon/splash.png',width: 1500, height: 1500,),
      backgroundColor: Colors.amber,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red,
    );
  }
}




// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';
// import 'package:flutter_app/map.dart';
// import 'package:flutter_app/new.dart';
// import 'package:flutter_app/suggest.dart';
// import 'package:flutter_app/temple.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:splashscreen/splashscreen.dart';


// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget {
//   final appTitle = 'เเห่เทียนพรรษาอุบลราชธานี';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: appTitle,
//       home: _TheMyApp(),
//     );
//   }
// }

// class _TheMyApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MyAppState();
//   }
// }



// class _MyAppState extends State<_TheMyApp> {
  
//   FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

//   @override
//   void initState() {
//     super.initState();
//     readData();
//   }

//   readData() async {
//     print("Reading Data From DataBase");

//     DatabaseReference databaseReference = firebaseDatabase
//         .reference()
//         .child('templeM')
//         .child('-LFVHWUjmJwJmj03SMyq');
//     await databaseReference.once().then((DataSnapshot dataSnapshop) {
//       // print('Data ==> ${dataSnapshop.value}');
// //    var getdata = (dataSnapshop.value['ratingCount']);
// //    print(getdata);
// //    return getdata;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.amber, // status bar color
//             brightness: Brightness.light,
//             title: Text("เเห่เทียนอุบลราชธานี")),
//         drawer: Drawer(
//           // Add a ListView to the drawer. This ensures the user can scroll
//           // through the options in the drawer if there isn't enough vertical
//           // space to fit everything.
//           child: ListView(
//             // Important: Remove any padding from the ListView.
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               UserAccountsDrawerHeader(
//                 accountName: Text(
//                   "UBON RATCHATANI UNIVERSITY",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 accountEmail: Text(
//                   "ubon.candle@gmail.com",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.amber,
//                 ),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundImage: new NetworkImage(
//                       'https://scontent.fbkk5-5.fna.fbcdn.net/v/t1.15752-9/78264477_501591130461955_409392661997289472_n.png?_nc_cat=100&_nc_eui2=AeGoF3fIXfRK5Su2Sn_ovjj_jNlVlI2ifg-KNZJLPhtnZ9vXNAMfdHA1rl28otrZz1uzRa8Hkx0bQoTiaXjtO76jvogG3hmV4X80u_nihOCLVQ&_nc_ohc=sgeZWOE4A0YAQmS0qsoZ9ONwmRjBTWGAPTjJPPR-8Mh5rM6FpH0RrzNNw&_nc_ht=scontent.fbkk5-5.fna&oh=dd891a2e7dc1fd72946469faf5ce1715&oe=5E86D5EC'),
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.chrome_reader_mode),
//                 title: Text('ข้อมูลเทียนเเต่ละวัด'),
//                 onTap: () {
//                   // Navigator.pop(context);
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (BuildContext context) => TemplePage()));
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.location_on),
//                 title: Text('แผนที่วัดทั้งหมด'),
//                 onTap: () {
//                   // Navigator.pop(context);
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (BuildContext context) => MapPage()));
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.library_books),
//                 title: Text('ข่าวสารล่าสุด'),
//                 onTap: () {
//                   // Navigator.pop(context);
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (BuildContext context) => NewsPage()));
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.comment),
//                 title: Text('แนะนำ'),
//                 onTap: () {
//                   // Navigator.pop(context);
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (BuildContext context) => SuggestPage()));
//                 },
//               ),
//               Divider(),
//               ListTile(
//                 leading: Icon(Icons.close, color: Colors.red),
//                 title: Text(
//                   'Close',
//                   style: TextStyle(color: Colors.red),
//                 ),
//                 onTap: () {
//                   // Navigator.pop(context);
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (BuildContext context) => MyApp()));
//                 },
//               ),
//             ],
//           ),
//         ),
//         body: Container(
//         child: Center(
//           child: ListView(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 // new Icon(Icons.assistant_photo),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text('กำหนดการงานแห่เทียนประจำปี 2562'),
//                     Text(readData().toString()),
//                   ],
//                 )
//               )
//             ],
//           ),
//           ),
//       ),
//       ),
//     );
//   }
// }
