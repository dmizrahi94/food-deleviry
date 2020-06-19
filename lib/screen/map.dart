import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(Map());

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Polyline> polyline = {};
  static const LatLng _center = const LatLng(40.677939, -73.941755);
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyA8XbPTG7eooFp-f4zDos-0521BA0TiPAI");

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _center,
    zoom: 18.4746,
  );
  List<LatLng> _routesCoord;

  @override
  void initState() {
    super.initState();
    getPoly();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    print(_routesCoord);

    polyline.add(Polyline(
        polylineId: PolylineId("route 1"),
        visible: true,
        points: _routesCoord,
        width: 4,
        startCap: Cap.roundCap,
        color: Colors.blue,
        endCap: Cap.buttCap));
  }

  void getPoly() async {
    try {
      _routesCoord = await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(40.677939, -73.941755),
          destination: LatLng(40.698432, -73.924038),
          mode: RouteMode.driving);
          print(_routesCoord);
    } catch (e) {
      print("error");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('map'),
          backgroundColor: Colors.green[700],
        ),
        body:  GoogleMap(
                onMapCreated: _onMapCreated,
                polylines: polyline,
                initialCameraPosition: _kGooglePlex,
              ),
      ),
    );
  }
}
