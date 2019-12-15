import 'package:flutter/material.dart';
import 'PostNews.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_html/flutter_html.dart';
// NewsPage
class NewsPage extends StatefulWidget {
  @override
  _MyPostNewsPageState createState() => _MyPostNewsPageState();
}

class _MyPostNewsPageState extends State<NewsPage> {
  List<PostNews> postsList = [];

  void initState() {
    super.initState();

    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("news");

    postsRef.once().then((DataSnapshot snap) {
      // var KEYS = snap.value.keys;
      var DATA = snap.value;
      var KEYS = [1, 2, 3, 4, 5, 6];

      postsList.clear();

      for (var individualKey in KEYS) {
        PostNews posts = new PostNews(
          DATA[individualKey]['detail'],
          DATA[individualKey]['image'],
          DATA[individualKey]['title'],
        );

        postsList.add(posts);
      }
      setState(() {
        print('asdfasfdasdf');
        print('Length : $postsList.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("ข่าวสารล่าสุด"),
        ),
        body: new Container(
          child: postsList.length == 0
              ? new Text("No blog")
              : new ListView.builder(
                  itemCount: postsList.length,
                  itemBuilder: (_, index) {
                    return PostsUI(postsList[index].detail,
                        postsList[index].image, postsList[index].title);
                  },
                ),
        ));
  }

  Widget PostsUI(String detail, String image, String title) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.network(image),
                      Html(data: detail)  
                      
                  ],
              ),
                ),
              SizedBox(height: 10.0,),

              // new Image.network(image,fit:BoxFit.cover),

              SizedBox(height: 10.0,),

              Html(data: title)
            ],
          );

    // return Card(
    //   elevation: 10.0,
    //   margin: EdgeInsets.all(15.0),

    //   child: new Container(
    //     padding: new EdgeInsets.all(14.0),

    //     child: new Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,

    //       children: <Widget>[
    //           new Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               new Text(
    //                 detail
    //               ),
    //           ],
    //         ),
    //         SizedBox(height: 10.0,),

    //         // new Image.network(image,fit:BoxFit.cover),

    //         SizedBox(height: 10.0,),

    //         new Text(
    //                 title
    //               ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
