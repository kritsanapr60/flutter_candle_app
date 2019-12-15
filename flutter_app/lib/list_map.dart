import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class List_MapPage extends StatefulWidget {

  String formalNames_th;

  List_MapPage({
    Key key,
    this.formalNames_th,

  }) : super(key: key);
  @override
  _List_MapPageState createState() => _List_MapPageState();
}

class _List_MapPageState extends State<List_MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.formalNames_th),
      ),
      body: Center(child: Text("Map Page"),),
    );
  }
}