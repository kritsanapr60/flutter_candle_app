import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class List_MapPage extends StatefulWidget {
    String formalNames_th;
    double lat;
    double lng;

  List_MapPage({
    Key key,
    this.formalNames_th,
    this.lat,
    this.lng,

  }) : super(key: key);
  @override
  State<List_MapPage> createState() => MapSampleState();
}

class MapSampleState extends State<List_MapPage> {
  List<Marker> allMarkers = [];

  GoogleMapController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(widget.lat, widget.lng)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("แผ่นที่"+widget.formalNames_th),
      ),
      body: Stack(
        children: [Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(widget.lat, widget.lng), zoom: 18.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        ]
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

}