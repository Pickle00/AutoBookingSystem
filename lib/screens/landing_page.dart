// import 'dart:async';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late GoogleMapController mapController;

  static const LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // final _places =
  // GoogleMapsPlaces(apiKey: 'AIzaSyCAQd-KRR7tb7SYIMFfHASHrXNYCo1LCAQ');

  // static const LatLng _center = const LatLng(45.521563, -122.677433);
  // String apiKey = "awc5eVGy1VM3WPGbzTX8Czq0K5neQDH5";
  // LatLng tomtomHQ = const LatLng(27.427915, 85.032600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 18.0,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("source"),
            position: _center,
          )
        },
      ),

      // Center(
      //     child: Stack(5
      //   children: <Widget>[
      //     FlutterMap(
      //       options: MapOptions(
      //         initialCenter: tomtomHQ,
      //         initialZoom: 13.0,
      //       ),
      //       children: [
      //         TileLayer(
      //           urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
      //               "{z}/{x}/{y}.png?key={apiKey}",
      //           additionalOptions: {"apiKey": apiKey},
      //         ),
      //         MarkerLayer(
      //           markers: [
      //             Marker(
      //               width: 40.0,
      //               height: 40.0,
      //               point: tomtomHQ,
      //               child: Image.asset("assets/person.png"),
      //             ),
      //             Marker(
      //               width: 40.0,
      //               height: 40.0,
      //               point: tomtomHQ,
      //               child: Image.asset("assets/person.png"),
      //             ),
      //           ],
      //           alignment: Alignment.center,
      //         ),
      //       ],
      //     ),
      //     // Container(
      //     //   padding: const EdgeInsets.all(20),
      //     //   alignment: Alignment.bottomLeft,
      //     //   child: Image.asset("assets/person.png"),
      //     // )
      //   ],
      // )),
    );
  }
}
