import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

const double CAMERA_ZOOM = 20;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION = LatLng(42.6871386, -71.2143403);

class Map extends StatefulWidget {
  final dynamic resturant;

  Map(resturant)
      : resturant = resturant,
        super();
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  dynamic args;

  final Set<Polyline> polyline = {};

  LatLng _center;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyA8XbPTG7eooFp-f4zDos-0521BA0TiPAI");

// this set will hold my markers
  Set<Marker> _markers = {};
// this will hold the generated polylines
  Set<Polyline> _polylines = {};
// this will hold each polyline coordinate as Lat and Lng pairs
  List<LatLng> polylineCoordinates = [];
// this is the key object - the PolylinePoints
// which generates every polyline between start and finish
  String googleAPIKey = "AIzaSyA8XbPTG7eooFp-f4zDos-0521BA0TiPAI";
  PolylinePoints polylinePoints = PolylinePoints();
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  static CameraPosition _kGooglePlex;
  List<LatLng> _routesCoord;

  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
    _center = LatLng(widget.resturant["cordinatex"], widget.resturant["cordinatey"]);
    _kGooglePlex = CameraPosition(
      zoom: CAMERA_ZOOM,
      bearing: CAMERA_BEARING,
      tilt: CAMERA_TILT,
      target: _center);
    setMapPins();
    // setPolylines();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), "assets/driving_pin.png");
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        "assets/destination_map_marker.png");
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
          origin: LatLng(32.094478, 34.776850),
          destination: LatLng(32.094476, 34.776736),
          mode: RouteMode.driving);
    } catch (e) {
      print("error");
      print(e);
    }
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId("sourcePin"),
          infoWindow: InfoWindow(
            title: widget.resturant["name"],
            snippet: widget.resturant["address"],
          ),
          visible: true,
          position: _center,
          icon: sourceIcon));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId("destPin"),
          position: DEST_LOCATION,
          icon: destinationIcon));
    });
  }

  setPolylines() async {
    List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
        googleAPIKey,
        SOURCE_LOCATION.latitude,
        SOURCE_LOCATION.longitude,
        DEST_LOCATION.latitude,
        DEST_LOCATION.longitude);
    if (result.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("------------------------");
    print(widget.resturant);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('map'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          polylines: _polylines,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
        ),
      ),
    );
  }
}
