import 'package:flutter/material.dart';

class SuggestPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("เเนะนำ"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text('เเสดงความคิดเห็น'),
              TextFormField(
  decoration: InputDecoration(
    border: InputBorder.none,
    labelText: ' '
  ),
),

        const SizedBox(height: 30),
        RaisedButton(
          onPressed: () {},
          child: const Text(
            'ส่งความคิดเห็น',
            style: TextStyle(fontSize: 20)
          ),
        ),
            ],

      ),
        ),),
    );
  }

}