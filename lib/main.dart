

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor:Colors.green
    ),
    home:Home()
  ));
}

class Home extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeState createState() => _HomeState();

}
class _HomeState extends State<Home> {
  static final CameraPosition initial=CameraPosition(target: LatLng(27.9135,78.0782),zoom:40);
  GoogleMapController _controller;
 Set<Marker> marker=Set.from([]);
  void initState(){
    super.initState();  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar:AppBar(title:Container
 (alignment: Alignment.center,
   child:Text("Google Map App",style:TextStyle(fontSize:20)))),
      body:GoogleMap(initialCameraPosition: initial,
      mapType:MapType.normal,
      markers: marker,
      onMapCreated: (controller){
      setState(() {
        _controller=controller;
      });
      },
      onTap: (coordinates){
        _controller.animateCamera(CameraUpdate.newLatLng(coordinates));
        Marker mark=Marker(markerId: MarkerId('1'),position: coordinates);
        setState((){
           marker.add(mark);
        });
      },),
      floatingActionButton: FloatingActionButton(onPressed:(){ _controller.animateCamera(CameraUpdate.zoomOut());},
      child: Icon(Icons.zoom_out),)
    );
  }}