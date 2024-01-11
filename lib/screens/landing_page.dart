import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String apiKey = "awc5eVGy1VM3WPGbzTX8Czq0K5neQDH5";
  LatLng tomtomHQ = const LatLng(27.427915, 85.032600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              initialCenter: tomtomHQ,
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                    "{z}/{x}/{y}.png?key={apiKey}",
                additionalOptions: {"apiKey": apiKey},
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 40.0,
                    height: 40.0,
                    point: tomtomHQ,
                    child: Image.asset("assets/person.png"),
                  ),
                  Marker(
                    width: 40.0,
                    height: 40.0,
                    point: tomtomHQ,
                    child: Image.asset("assets/person.png"),
                  ),
                ],
                alignment: Alignment.center,
              ),
            ],
          ),
          // Container(
          //   padding: const EdgeInsets.all(20),
          //   alignment: Alignment.bottomLeft,
          //   child: Image.asset("assets/person.png"),
          // )
        ],
      )),
    );
  }
}
