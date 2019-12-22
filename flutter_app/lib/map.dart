import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  List alllatlng;

  MapPage({Key key,this.alllatlng}) : super(key:key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> allMarkers = [];

  GoogleMapController _controller;

  @override
  void initState() {
    super.initState();
    for(var datalatlng in widget.alllatlng){
      allMarkers.add(
        Marker(
          markerId: MarkerId(datalatlng.temple),
          draggable: true,
          infoWindow: InfoWindow(title: datalatlng.temple),
          position: LatLng(datalatlng.lng, datalatlng.lat),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('แผนที่วัดทั้งหมด'),
      ),
      body: Stack(
        children: [Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(15.2392149, 104.851161), zoom: 13.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        Text("\n"),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: movetoNewYork,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.amber,
                
              ),
              child: Icon(Icons.zoom_out, color: Colors.white),
            ),
          ),
        )
        ]
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  zoomnaja(lat,lng){
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(lat, lng), zoom: 18.0, bearing: 45.0, tilt: 45.0),
    ));
  }

  movetoNewYork() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(15.2229823, 104.8820134), zoom: 12.0),
    ));
  }
}