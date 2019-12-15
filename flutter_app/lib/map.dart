import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("แผนที่วัดทั้งหมด"),
      ),
      body: Center(child: Text("Map Page"),),
    );
  }

}